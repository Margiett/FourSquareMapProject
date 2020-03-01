//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {
  static let ClientId = "A13JVZ51FGAG0W01IQ2Z40H0AS343J40AK5C1QRBOW4AR2XK"
    static let ClientSecret = "HCMJ0RDBWL3ARU5CK3CE4JROQJU5LVIPFR55CX3AUJMBFCZ5"

    
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
