//
//  TabBarController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence

class TabBarController: UITabBarController {
    
    public var dataPersistence = DataPersistence<Map>(filename: "savedLocation.plist")
    private var userPreference = UserPreference()
    
    private lazy var searchVC: SearchViewController = {
        let vc = SearchViewController(dataPersistence: dataPersistence, userPreference: userPreference)
        vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), tag: 0)
        return vc
    }()
    
    private lazy var collectionVC: FavoritesViewController = {
       
        let vc = FavoritesViewController(dataPersistence: dataPersistence, userPreference: userPreference)
        
        vc.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "folder.badge.plus"), tag: 1)
        return vc
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [UINavigationController(rootViewController: searchVC), UINavigationController(rootViewController: collectionVC)]
    }
    
    
    
    
}
