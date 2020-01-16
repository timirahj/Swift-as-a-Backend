import FluentSQLite
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    
    // Register providers first
    try services.register(FluentSQLiteProvider())

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)


    
    let directoryConfig = DirectoryConfig.detect()
       services.register(directoryConfig)
       
    // Configure a SQLite database
    var databaseConfig = DatabasesConfig()
    let db = try SQLiteDatabase(storage: .file(path: "\(directoryConfig.workDir)students.db"))
           databaseConfig.add(database: db, as: .sqlite)
           services.register(databaseConfig)

    // Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Student.self, database: .sqlite)
    services.register(migrations)

}
