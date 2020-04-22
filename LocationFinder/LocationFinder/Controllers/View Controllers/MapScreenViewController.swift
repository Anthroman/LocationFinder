//
//  MapScreenViewController.swift
//  LocationFinder
//
//  Created by Anthroman on 4/21/20.
//  Copyright © 2020 Anthroman. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapScreenViewController: UIViewController, MKMapViewDelegate {

    //MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Properties
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    let metersPerMile: Double = 1609.344
    let fiveMiles: Double = 8046.72
    let oneMile: Double = 1609.344
    
//    let joshuaLocation = UserController.sharedInstance.mockUsers[0].userLocation
//    let evilJoshuaLocation = UserController.sharedInstance.mockUsers[1].userLocation
//    let theoLocation = UserController.sharedInstance.mockUsers[2].userLocation
//    let evilTheoLocation = UserController.sharedInstance.mockUsers[3].userLocation
    let dave = UserController.sharedInstance.mockUsers[4]
    let evilDave = UserController.sharedInstance.mockUsers[5]
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkLocationServices()
        print("The distance between Dave and Evil Dave is \(String(describing: dave.userLocation!.distance(from: evilDave.userLocation!) / metersPerMile)) miles!")
        print("Within five miles? \(dave.isWithinDistance(of: fiveMiles, from: evilDave))")
        print("Within one mile? \(dave.isWithinDistance(of: oneMile, from: evilDave))")
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // show alert letting user know they must turn this on
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .denied:
            //alert letting instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            //alert letting them know access for the user is restricted
            break
        case .authorizedAlways:
            break
        @unknown default:
            print("Default case for CLLocationManager.authorizationStatus()")
        }
    }//end of checkLocationAuthorization func
}//end of MapScreenVC class

extension MapScreenViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        checkLocationAuthorization()
    }
}
