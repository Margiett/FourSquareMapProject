//
//  CoreLocation.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
import CoreLocation


class CoreLocationSession: NSObject {
    
    public var locationManager: CLLocationManager
    
    override init() {
       
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        startSignificantChanges()
        
    }
    
    private func startSignificantChanges(){
        
        if !CLLocationManager.significantLocationChangeMonitoringAvailable(){
            return
        }
        
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    public func convertCoordinatesToPlacemark(coordinate: CLLocationCoordinate2D){
        
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("reverseGeocodeLocation \(error)")
            }
            
            if  let firstPlacemark = placemarks?.first {
                print("placemark info: \(firstPlacemark)")
            }
        }
        
    }
    
    public func convertPlaceNameToCoordinates(addressString: String){
        //converting an address to a coordinate
        
        CLGeocoder().geocodeAddressString(addressString) { (placemarks, error) in
            if let error = error{
                print("geocodeAddressString: \(error)")
            }
            if let firstPlacemark = placemarks?.first,
                let location = firstPlacemark.location{
                print("placeName coordinate is  \(location.coordinate)")
            }
        }
    }
    
}

extension CoreLocationSession: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations \(locations)")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFail with error \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .denied:
            print("denied")
            
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion: \(region)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion: \(region)")
    }
}


