import Fluent
import Vapor

struct CategoryController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let categories = routes.grouped("categories")
        categories.get(use: getAllView)
        categories.get("new", use: createView)
        categories.post(use: create)
        categories.group(":id") { category in
            category.post("delete", use: delete)
            category.post("edit", use: edit)
            category.get("edit", use: editView)
            category.get(use: getByIdView)
        }
    }
    
    func getAllView(req: Request) throws -> EventLoopFuture<View> {
        return Category.query(on: req.db).all().flatMap { categories in
            let data = ["categories": categories]
            return req.view.render("Categories/index", data)
        }
    }
    
    func getByIdView(req: Request) throws -> EventLoopFuture<View> {
        guard let categoryID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        do {
            return try Category.find(categoryID, on: req.db).unwrap(or: Abort(.notFound)).flatMap { category in
                let data = ["category": category]
                return req.view.render("Categories/show", data)
            }
        } catch {
            throw Abort(.internalServerError, reason: "Failed to retrieve category: \(error)")
        }
    }
    
    func create(req: Request) throws -> EventLoopFuture<Response> {
        let category = try req.content.decode(Category.self)
        return category.save(on: req.db).flatMap {
            return req.eventLoop.makeSucceededFuture(req.redirect(to: "/categories"))
        }
    }

    func createView(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("Categories/create")
    }

    func edit(req: Request) throws -> EventLoopFuture<Response> {
        let updatedCategory = try req.content.decode(Category.self)
        return Category.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { category in
                category.name = updatedCategory.name
                return category.save(on: req.db).flatMap {
                    return req.eventLoop.makeSucceededFuture(req.redirect(to: "/categories"))
                }
            }
    }

    func editView(req: Request) throws -> EventLoopFuture<View> {
        return Category.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { category in
                return req.view.render("Categories/edit", ["category": category])
            }
        
    }
    
    func delete(req: Request) throws -> EventLoopFuture<Response> {
        return Category.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { category in
                return category.delete(on: req.db).flatMap {
                    return req.eventLoop.makeSucceededFuture(req.redirect(to: "/categories"))
                }
            }
    }
    
}
