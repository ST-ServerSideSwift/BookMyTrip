import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let tripController = TripController()
    try router.register(collection: tripController)
    
}
