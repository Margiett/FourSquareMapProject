//
//  PendingNotifications.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
import UserNotifications

class PendingNotification {
    public func getPendingNotifications(completion: @escaping ([UNNotificationRequest]) -> ()) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
            print("there are \(requests.count) pending requests")
            completion(requests)
        }
    }
    
}
