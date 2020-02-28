//
//  UserCollection.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/27/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct UserCollection: Codable & Equatable{
    let collectionName: String
    let pickedImage: Data
}
