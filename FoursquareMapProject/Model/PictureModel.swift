//
//  PictureModel.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/24/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct PhototSearch: Codable & Equatable {
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

