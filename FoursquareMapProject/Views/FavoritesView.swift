//
//  CollectionView.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import Gemini

class FavoritesView: UIView {
    
    public lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.backgroundColor = #colorLiteral(red: 1, green: 0.3698191643, blue: 0.802052021, alpha: 1)
        return sb
        
    }()

    public lazy var geminiCollectionView: GeminiCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 150)
        let cv = GeminiCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.9672935605, alpha: 1)
        return cv
    
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
        setupSearchBar()
        setupGeminiCollectionViewConstraints()
        
    }
    private func setupSearchBar(){
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  0),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
        
        ])
    }
    
    private func setupGeminiCollectionViewConstraints() {
        addSubview(geminiCollectionView)
        
        geminiCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            geminiCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            geminiCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            geminiCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            geminiCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }

}
