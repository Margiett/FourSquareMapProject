//
//  FaveTableView.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/27/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class FaveTableView: UIView {
    lazy var contentViewSize = CGSize(width: centerView.frame.width, height: centerView.frame.height + 450)
   
    public lazy var centerView: UIView = {
        let centeredV = UIView()
        return centeredV
        
    }()
    public lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.frame = self.bounds
        sv.contentSize = CGSize(width: (self.frame.width * 0.75), height: (self.frame.height * 0.658))
        sv.backgroundColor = .systemBackground
        return sv
    }()
    
    public lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero)
        return tv
        
    }()
    
     override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        private func commonInit() {
            setupTableViewConstraints()
        }
        
        private func setupTableViewConstraints() {
            addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        }

    }
    

