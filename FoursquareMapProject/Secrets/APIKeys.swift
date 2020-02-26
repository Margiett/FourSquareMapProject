//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {
  static let CientId = ""
    static let ClientSecret = ""
    
}


extension Date{
func currectDate() -> String{
    let currentDateAndTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateFormatter.string(from: currentDateAndTime)
        print(date )
        
        return date
    }
}
