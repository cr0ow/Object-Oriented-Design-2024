import Vapor

final class ProductDTO : Content {
    var id: UUID?
    var name: String
    var price: Double
    var category: String

    init(id: UUID? = nil, name: String, price: Double, category: String) {
        self.id = id
        self.name = name
        self.price = price
        self.category = category
    }
}