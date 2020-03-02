//
//  SearchTableView.swift
//  FoursquareMapProject
//
//  Created by David Lin on 2/24/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//


import UIKit

class SearchTableView: UIView {
   
  public lazy var tableView: UITableView = {
    let tableView = UITableView()
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
    addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
      tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
     
     
    ])
     
  }
}













