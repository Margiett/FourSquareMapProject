//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {

  static let ClientId = ""
    static let ClientSecret = ""
//UKHG24JNBB4BF03MGIXPBLOTFHESFAYGC44TWXXBJJ4GMURN
//Z4CVSWOT0K124N0FPATUS5J4XWNY0NA5QBWD014OPFQJFNGI
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

