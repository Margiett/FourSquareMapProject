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
//    let userPreference = UserPreference()
    let dataPersistence: DataPersistence<Venue>
    
    let searchVC = SearchViewController(DataPersistence<Venue>(filename: "savedLocation.plist"), userPreference: UserPreference())
    
    init(_ dataPersistence: DataPersistence<Venue>) {
        self.dataPersistence = dataPersistence
        super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
        searchVC.delegate = self
        searchTableView.tableView.dataSource = self
        searchTableView.tableView.delegate = self
        print("viewDidLoad")
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
        return allLocations.count
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("yes")
        
                 navigationController?.navigationBar.isHidden = false
           let venueItem = allLocations[indexPath.row]
            let detailVC = SearchDetailViewController(venueItem, dataPersistence: dataPersistence)
                 detailVC.navigationItem.title = venueItem.name
                 present(detailVC, animated: true)
    }
}

extension SearchTableVC: SearchButtonPressedDelegate {
    func searchButtonPressed(venue: [Venue]) {
        self.allLocations = venue
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let venueItem = allLocations[indexPath.row]
//        let detailVC = SearchDetailViewController(venueItem, dataPersistence)
//        detailVC.navigation.title = venueItem.name
//        present(UINavigationController(rootViewController: detailVC), animated:true)
    }
    
}
