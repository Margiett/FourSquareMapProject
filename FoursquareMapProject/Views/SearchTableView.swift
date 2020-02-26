//
//  SearchTableView.swift
//  FoursquareMapProject
//
//  Created by David Lin on 2/24/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//


import UIKit

class SearchTableView: UIView {
   
  public lazy var searchTableView: UITableView = {
    let tableView = UITableView()
//    tableView.backgroundColor = colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    return tableView
  }()
   
  override init(frame: CGRect) {
      super.init(frame: UIScreen.main.bounds)
      commonInit()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder:coder)
      commonInit()
    }
    
    
    private func commonInit() {
      setupTableViewConstraint()
    }
   
  private func setupTableViewConstraint() {
    addSubview(searchTableView)
    searchTableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      searchTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
      searchTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      searchTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      searchTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
     
     
    ])
     
  }
}













