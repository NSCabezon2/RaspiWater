import Fluent

struct CreateSensor: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Sensor.schema)
            .id()
            .field("name", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Sensor.schema).delete()
    }
}
