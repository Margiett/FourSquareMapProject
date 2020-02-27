//
//  PictureModel.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/24/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct PhotoModel: Codable & Equatable {
     let response: PhotoResponse
}
struct PhotoResponse: Codable & Equatable {
    let photos: Photos
}

struct Photos: Codable & Equatable {
    let items: [Photo]
}

struct Photo: Codable & Equatable { // photo info
    let prefix: String
    let suffix: String
}

//struct PhotoModel: Codable {
//    //let response: Response
//    let photos: Photos
//}
//
//
//struct Photos: Codable {
//    let count: Int
//    let items: [Item]
//    let dupesRemoved: Int
//}
//
//struct Item: Codable {
//    let id: String
//    let createdAt: Int
//    let source: Source
//    let itemPrefix: String
//    let suffix: String
//    let width, height: Int
//    let checkin: Checkin
//    let visibility: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case createdAt
//        case source
//        case itemPrefix = "prefix"
//        case suffix
//        case width
//        case height
//        case checkin
//        case visibility
//    }
//}
//
//
//struct Checkin: Codable {
//    let id: String
//    let createdAt: Int
//    let type: String
//    let timeZoneOffset: Int
//}
//
//
//struct Source: Codable {
//    let name: String
//    let url: String
//}



