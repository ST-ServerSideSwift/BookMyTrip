import Foundation
import Vapor
import FluentSQLite

final class Trip: Content {
    var id: Int?
    var destination: String
    var price: Double

    init(id: Int?, destination: String, price: Double) {
        self.id = id
        self.destination = destination
        self.price = price
    }
}

extension Trip: SQLiteModel {
    public static let entity: String = "trips"
}

extension  Trip: Migration {}

extension Trip: Parameter {}
