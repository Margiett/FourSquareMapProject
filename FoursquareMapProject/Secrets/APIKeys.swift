//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {
    
    static let ClientId = "UKHG24JNBB4BF03MGIXPBLOTFHESFAYGC44TWXXBJJ4GMURN"
static let ClientSecret = "43D1VSNLKBYWSATV4IBCKJPBTFF3RBVDUN4HOZGDBSHTXYLN"
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
