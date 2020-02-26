//
//  SearchTableVC.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/26/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import Pulley
class SearchTableVC: UIViewController {
   
  let searchTableView = SearchTableView()
   
  private var allLocations = [String]() {
    didSet{
      DispatchQueue.main.async {
        self.searchTableView.searchTableView.reloadData()
      }
    }
  }
   
  override func loadView() {
    view = searchTableView
  }
  override func viewDidLoad() {
    super.viewDidLoad()
  }
   
}
extension SearchTableVC: PulleyDrawerViewControllerDelegate {
  func collapsedDrawerHeight(bottomSafeArea: CGFloat) -> CGFloat {
    return 120
  }
}
extension SearchTableVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
   
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
      fatalError()
    }
    return cell
  }
   
}
extension SearchTableVC: UITableViewDelegate {
   
}
