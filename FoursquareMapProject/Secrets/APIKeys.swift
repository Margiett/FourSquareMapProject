//
//  APIKeys.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/25/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct APIKeys {
    
    //Original
//  static let ClientId = "KO1VTJ5W522PD1TGSMSJ3XXTPWDTPWJAVXKM0B5VDIGOQ0T3"
//    static let ClientSecret = "X4NBACIJIBMDHT2XNYO413GNNXP2QKX1MVEONCG2MJAKZ5CS"
    //MARK: Margiett API
  static let ClientId = "UKHG24JNBB4BF03MGIXPBLOTFHESFAYGC44TWXXBJJ4GMURN"
    static let ClientSecret = "M3YXH4LTME3VNJX1V3LJ34LHHA5D3PKGXXPZEAUXSW2LOGC3"
    
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
