//
//  TabBarController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence
import Pulley
class TabBarController: UITabBarController {
   
  public var dataPersistence = DataPersistence<Venue>(filename: "savedLocation.plist")
    
  private var userPreference = UserPreference()
   
  private lazy var mainVC: MainVC = {
    let searchVC = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController")
     
    let searchTableVC = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(identifier: "SearchTableVC")
     
    let vc = MainVC(contentViewController: searchVC, drawerViewController: searchTableVC)
    vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), tag: 0)
    return vc
  }()
   
//  private lazy var searchVC: SearchViewController = {
//    let vc = SearchViewController(dataPersistence: dataPersistence, userPreference: userPreference)
//    vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), tag: 0)
//    return vc
//  }()
   
  private lazy var collectionVC: FavoritesViewController = {
     
    let vc = FavoritesViewController(dataPersistence: dataPersistence, userPreference: userPreference)
     
    vc.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "folder.badge.plus"), tag: 1)
    return vc
  }()
   
   
   
  override func viewDidLoad() {
    super.viewDidLoad()
    tabBar.tintColor = .black
    
    viewControllers = [UINavigationController(rootViewController: mainVC), UINavigationController(rootViewController: collectionVC)]
  }   
}
