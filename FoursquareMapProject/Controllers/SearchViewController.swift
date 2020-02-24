//
//  SearchViewController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence

class SearchViewController: UIViewController {
    
    
    let searchView = SearchView()
    
    private var dataPersistence: DataPersistence<Map>
    
    private var userPreference: UserPreference
    
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
         view = searchView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchView.mapView.showsUserLocation = true
        
    }
    
    
    
    
}
