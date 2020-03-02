//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {
    
    static let ClientId = "132PJJ4I2DMPQQGC5PM2KG11OZ0P3TCBWKZ0T0SNPMOOWIXC"
    static let ClientSecret = "XFMZT5KWVZALJLFJP4CAKOW52RXTC10ZHRTVME3ZW0JITIUV"
    
    
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

