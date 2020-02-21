//
//  CollectionViewController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence

class FavoritesViewController: UIViewController {
 
    private var dataPersistence: DataPersistence<Map>

     private var userPreference: UserPreference
    
    let collectionView = FavoritesView()
    
       
       init(dataPersistence: DataPersistence<Map>,userPreference: UserPreference) {
           self.dataPersistence = dataPersistence
           self.userPreference = userPreference
           super.init(nibName: nil, bundle: nil)
          // self.userPreference.delegate = self
       }
       required init?(coder: NSCoder) {
             fatalError("init couldnt be implemented")
         }
 
    
    override func loadView() {
         view = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

    }
    

  

}
