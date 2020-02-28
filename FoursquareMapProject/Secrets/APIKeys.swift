//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {
  static let ClientId = "KO1VTJ5W522PD1TGSMSJ3XXTPWDTPWJAVXKM0B5VDIGOQ0T3"
    static let ClientSecret = "X4NBACIJIBMDHT2XNYO413GNNXP2QKX1MVEONCG2MJAKZ5CS"

    
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
