//
//  SearchQuery.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

 private let locationSession = CoreLocationSession()

struct SearchQuery {
    
    static let lat = locationSession.locationManager.location?.coordinate.latitude
    static let long = locationSession.locationManager.location?.coordinate.longitude
    static let wordSearch = String()
    
}
