//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {
  static let ClientId = "IQK0REAHB3TNQ1C0NDPTZV1VJT0NCPIATCOODFL1JB5HUNXF"
    static let ClientSecret = "NWUC0N5TXWJUDGJSSJKBSXCWXAKPSBTWDFLH0ZGBVWG4MWMF"

//    https://api.foursquare.com/v2/venues/search?client_id=KRPYYF2RSF40EJAS0ZCCOWXXDTGI4WXSURO1LHJBRAEZ0AWF&client_secret=V2HAWF3RNWZXY20ZCGA1KDCIDPE0AZ3SG1G5S3TUNLKQFVPC&v=20210102&near=queens&intent=browse&radius=1500&query=pizza&limit=5
    
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
