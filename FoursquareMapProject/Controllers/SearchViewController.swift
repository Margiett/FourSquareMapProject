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
   
  private var dataPersistence: DataPersistence<Map>?
   
  private var userPreference: UserPreference?
   
  private var allLocations = [String]() {
    didSet{
      DispatchQueue.main.async {
        self.searchView.collectionView.reloadData()
      }
    }
  }
   
   
   
   
//  init(dataPersistence: DataPersistence<Map>,userPreference: UserPreference) {
//    self.dataPersistence = dataPersistence
//    self.userPreference = userPreference
//    super.init(nibName: nil, bundle: nil)
//    // self.userPreference.delegate = self
//  }
//
//  required init?(coder: NSCoder) {
//    fatalError("init couldnt be implemented")
//  }
//
   
  override func loadView() {
    view = searchView
  }
   
   
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    searchView.collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
    searchView.mapView.showsUserLocation = true
    searchView.collectionView.dataSource = self
  }
   
}
extension SearchViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return 10
  }
   
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else {
      fatalError()
    }
     
    cell.backgroundColor = .white
    return cell
  }
   
   
}
