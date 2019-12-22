//
//  TripController.swift
//  BookMyTrip
//
//  Created by subash on 12/21/19.
//
//

import Foundation
import Vapor
import FluentSQLite

final class TripController: RouteCollection {

    func boot(router: Router) throws {
        let tripRoutes = router.grouped("api/trips")
        tripRoutes.post(Trip.self,use: postTrip)
        tripRoutes.get(use: getAll)
        tripRoutes.get(Trip.parameter, use: getById)
        tripRoutes.delete(use: deleteById)
    }
    
   ///Post a trip
    func postTrip(req: Request, trip:Trip) -> Future<Trip> {
        return trip.save(on: req)
    }

    ///Get all trips
    func getAll(req: Request) -> Future<[Trip]> {
        return Trip.query(on: req).all()
    }

    //Get trip by Id
    func getById(req: Request) throws -> Future<Trip> {
        return try req.parameters.next(Trip.self)
    }
    
    //Delete by id
    func deleteById(req: Request) throws -> Future<Trip> {
        return try req.parameters.next(Trip.self).delete(on: req)
    }
}
