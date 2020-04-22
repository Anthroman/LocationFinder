//
//  User.swift
//  LocationFinder
//
//  Created by Anthroman on 4/21/20.
//  Copyright © 2020 Anthroman. All rights reserved.
//

import Foundation
import CoreLocation

class User {

    let username: String
    var userLocation: CLLocation?

    init(username: String, userLocation: CLLocation) {
        self.username = username
        self.userLocation = userLocation
    }
    
    func isWithinDistance(of distance: Double, from user: User) -> Bool {
        return (self.userLocation?.distance(from: user.userLocation!))! < distance
    }
}

