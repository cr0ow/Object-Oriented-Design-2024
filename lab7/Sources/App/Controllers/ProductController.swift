import Fluent
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")
        products.get(use: getAllView)
        products.get("new", use: createView)
        products.post(use: create)
        products.group(":id") { product in
            product.post("delete", use: delete)
            product.post("edit", use: edit)
            product.get("edit", use: editView)
            product.get(use: getByIdView)
        }
    }
    
    func getAllView(req: Request) throws -> EventLoopFuture<View> {
        return Product.query(on: req.db).with(\.$category).all().flatMap { products in
            let productDTOs = products.map { product in
                ProductDTO(id: product.id!, name: product.name, price: product.price, category: product.category.name)
            }
            let data = ["products": productDTOs]
            return req.view.render("Products/index", data)
        }
    }
    
    func getByIdView(req: Request) throws -> EventLoopFuture<View> {
        guard let productID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        do {
            return try Product.query(on: req.db)
                .filter(\.$id == productID)
                .with(\.$category)
                .first()
                .unwrap(or: Abort(.notFound)).flatMap { product in
                    let productDTO = ProductDTO(id: product.id!, name: product.name, price: product.price, category: product.category.name)
                    return req.view.render("Products/show", ["product": productDTO])
            }
        } catch {
            throw Abort(.internalServerError, reason: "Failed to retrieve product: \(error)")
        }
    }
    
    func create(req: Request) throws -> EventLoopFuture<Response> {
        let productDTO = try req.content.decode(ProductDTO.self)
        return Category.query(on: req.db).filter(\.$name == productDTO.category).first()
            .unwrap(or: Abort(.notFound))
            .flatMapThrowing { category in
                guard let categoryID = category.id else {
                    throw Abort(.badRequest)
                }
                let product = Product(name: productDTO.name, price: productDTO.price, categoryID: categoryID)
                return product.save(on: req.db)
            }
            .flatMap { _ in
            return req.eventLoop.makeSucceededFuture(req.redirect(to: "/products"))
        }
    }

    func createView(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("Products/create")
    }

    func edit(req: Request) throws -> EventLoopFuture<Response> {
        let updatedProduct = try req.content.decode(ProductDTO.self)
        guard let productID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return Product.query(on: req.db)
            .filter(\.$id == productID)
            .with(\.$category)
            .first()
            .unwrap(or: Abort(.notFound))
            .flatMap { product in
                return Category.query(on: req.db)
                    .filter(\.$name == updatedProduct.category)
                    .first()
                    .unwrap(or: Abort(.notFound))
                    .flatMapThrowing { category in
                        product.name = updatedProduct.name
                        product.price = updatedProduct.price
                        product.$category.id = try category.requireID()
                        return product.save(on: req.db)
                    }
                    .flatMap { _ in
                        return req.eventLoop.makeSucceededFuture(req.redirect(to: "/products"))
                    }
            }
    }

    func editView(req: Request) throws -> EventLoopFuture<View> {
        guard let productID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return Product.query(on: req.db)
            .filter(\.$id == productID)
            .with(\.$category)
            .first()
            .unwrap(or: Abort(.notFound))
            .flatMap { product in
                let productDTO = ProductDTO(id: product.id!, name: product.name, price: product.price, category: product.category.name)
                return req.view.render("Products/edit", ["product": productDTO])
            }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<Response> {
        return Product.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { product in
                return product.delete(on: req.db).flatMap {
                    return req.eventLoop.makeSucceededFuture(req.redirect(to: "/products"))
                }
            }
    }
}

