//
//  SearchTableVC.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/26/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import Pulley
import DataPersistence



class SearchTableVC: UIViewController {
    
    let searchTableView = SearchTableView()
    
    private var allLocations = [Venue]() {
        didSet{
            DispatchQueue.main.async {
                self.searchTableView.tableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = searchTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    // Hides and shortens the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // allows the nav bar to show again in the detailVC
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
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
        let detailTVC = allLocations[indexPath.row]
        cell.configureCell(venue: detailTVC)
        cell.backgroundColor = .white
        return cell
    }
    
}
extension SearchTableVC: UITableViewDelegate {
    
}
