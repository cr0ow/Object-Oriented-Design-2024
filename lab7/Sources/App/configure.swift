import Vapor
import Fluent
import FluentSQLiteDriver
import Leaf

public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // register routes
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    
    app.views.use(.leaf)
    
    app.migrations.add(CreateCategory())
    app.migrations.add(CreateProduct())

    try routes(app)
}
