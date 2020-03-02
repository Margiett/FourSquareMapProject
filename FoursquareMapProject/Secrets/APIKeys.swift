//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {

<<<<<<< HEAD
  static let ClientId = "UKHG24JNBB4BF03MGIXPBLOTFHESFAYGC44TWXXBJJ4GMURN"
    static let ClientSecret = "43D1VSNLKBYWSATV4IBCKJPBTFF3RBVDUN4HOZGDBSHTXYLN"
=======
  static let ClientId = "RQOTHW5EUA01SAN4K5PVJW5WV5O4V4ZLKTGWXX1T01H20CQJ"
    static let ClientSecret = "YN5ARSPE4D3BADQ01ZWLOZJVFUQZ1MNMPI3ITSM1RWH52UZ4"


  static let ClientId = "CUQ0E41QUTZXKEQ42X14VIOT4HSVFK3MJTGAMDEG4Z3XWCC5"
    static let ClientSecret = "NNHOPGRQ10IGIYIIURQVJTN0HAEL1MZP5HMMIUMXZWVPSH1R"
>>>>>>> 739440650633f663ef8c0bfb3a9dcfe661d07650


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
