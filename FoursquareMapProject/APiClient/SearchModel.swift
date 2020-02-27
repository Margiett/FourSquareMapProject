//
//  SearchModel.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/24/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct VenueSearch: Codable & Equatable {
    let response: Response
}
struct Response: Codable & Equatable {
    let venues: [Venue]
}
struct Venue: Codable & Equatable  {
    let id: String
    let name: String
    let location: Location
    let categories: [Category]
}
struct Location: Codable & Equatable{
    let address: String?
    let crossStreet: String?
    let lat: Double
    let lng: Double
    let postalCode: String?
    let cc: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]
}
struct Category: Codable & Equatable {
    let name: String
    let icon: Icon
}
struct Icon: Codable & Equatable {
    let prefix: String
    let suffix: String
}






//struct Response: Codable {
//    let venues: [Venue]
//
//}
//
//struct Venue: Codable {
//    let id: String
//    let name: String
//    let location: Location
//    let categories: [Category]
//    let referralId: ReferralID
//    let hasPerk: Bool
//    let venuePage: VenuePage?
//
//}
//
//struct Category: Codable {
//    let id: String
//    let name: String
//    let pluralName: String
//    let shortName: String
//    let icon: Icon
//    let primary: Bool
//}
//
//
//struct Icon: Codable {
//    let iconPrefix: String
//    let suffix: Suffix
//
//    enum CodingKeys: String, CodingKey {
//        case iconPrefix = "prefix"
//        case suffix
//    }
//}
//
//enum Suffix: String, Codable {
//    case png = ".png"
//}
//
//struct Location: Codable {
//    let lat: Double
//    let lng: Double
//    let labeledLatLngs: [LabeledLatLng]
//    let distance: Int
//    let cc: Cc
//    let city: City?
//    let state: State
//    let country: Country
//    let formattedAddress: [String]
//    let address, crossStreet, postalCode: String?
//}
//
//enum Cc: String, Codable {
//    case us = "US"
//}
//
//enum City: String, Codable {
//    case bronx = "Bronx"
//    case brooklyn = "Brooklyn"
//    case newYork = "New York"
//    case rioDeJaneiro = "Rio de Janeiro"
//}
//
//enum Country: String, Codable {
//    case unitedStates = "United States"
//}
//
//
//struct LabeledLatLng: Codable {
//    let label: Label
//    let lat: Double
//    let lng: Double
//}
//
//enum Label: String, Codable {
//    case display = "display"
//}
//
//enum State: String, Codable {
//    case newYork = "New York"
//    case ny = "NY"
//}
//
//enum ReferralID: String, Codable {
//    case v1582568525 = "v-1582568525"
//}
//
//
//struct VenuePage: Codable {
//    let id: String
//}
//
//
