//
//  LocationManager.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/5/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var locationUpdates: Int = 0
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    func requestAuth() {
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        locationUpdates += 1
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        print("didFailWithError method called")
    }
    func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }
    
    
}
