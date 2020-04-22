//
//  UserController.swift
//  LocationFinder
//
//  Created by Anthroman on 4/21/20.
//  Copyright © 2020 Anthroman. All rights reserved.
//

import Foundation
import CoreLocation

class UserController {
    
    static let sharedInstance = UserController()

    var mockUsers: [User] = {
        let joshua = User(username: "Joshua", userLocation: CLLocation(latitude: 5.5, longitude: 7.2))
        let evilJoshua = User(username: "Evil Joshua", userLocation: CLLocation(latitude: 5.3, longitude: 6.9))
        let theo = User(username: "Theo", userLocation: CLLocation(latitude: 5.501, longitude: 7.202))
        let evilTheo = User(username: "Evil Theo", userLocation: CLLocation(latitude: 5.505, longitude: 7.230))
        let dave = User(username: "Dave", userLocation: CLLocation(latitude: 60.985, longitude: 60.985))
        let evilDave = User(username: "Evil Dave", userLocation: CLLocation(latitude: 60.999, longitude: 60.999))
        
        return [joshua, evilJoshua, theo, evilTheo, dave, evilDave]
    }()
    
    
}
