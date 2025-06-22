import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    //    меняем хост
    //    app.http.server.configuration.hostname = "domen or IP"
    //    меняем номер порта
    app.http.server.configuration.port = 8086
    
    app.views.use(.leaf)


    // register routes
    try routes(app)
}
