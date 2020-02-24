//
//  SearchView.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

import UIKit
import MapKit

class SearchView: UIView {
    
    public lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    public lazy var topSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.placeholder = "search"
        searchBar.layer.cornerRadius = 5.0
        return searchBar
    }()
    
    public lazy var bottomSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.placeholder = "location"
        searchBar.text = "New York City"
        searchBar.layer.cornerRadius = 5.0
        return searchBar
    }()
    
    public lazy var toggleSearchViewButton: UIButton = {
        let toggleButton = UIButton()
        toggleButton.setImage(UIImage(systemName: "text.justify"), for: .normal)
        toggleButton.backgroundColor = .white
        toggleButton.layer.cornerRadius = 5.0
        toggleButton.tintColor = .black
        return toggleButton
    }()
    
    
    public lazy var searchButton: UIButton = {
       let searchButton = UIButton()
        searchButton.setTitle("Search", for: .normal)
        searchButton.backgroundColor = .white
        searchButton.layer.cornerRadius = 5.0
        searchButton.setTitleColor(.black, for: .normal)
        return searchButton
    }()
    
    
    public lazy var collectionView: UICollectionView = {
       let collectionViewBackground = UIView()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 400, height: 100)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collectionView
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
        setupMapViewConstraints()
        setupTopSearchButtonConstraints()
        setupBottomSearchButtonConstraints()
        setupToggleButtonConstraints()
        setupSearchButton()
        setupCollectionView()
    }
    
    private func setupMapViewConstraints() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -45),
            mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    private func setupTopSearchButtonConstraints() {
        addSubview(topSearchBar)
        topSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            topSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            topSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60)
        ])
    }
    
    private func setupBottomSearchButtonConstraints() {
        addSubview(bottomSearchBar)
        bottomSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomSearchBar.topAnchor.constraint(equalTo: topSearchBar.bottomAnchor, constant: 0),
            bottomSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bottomSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
        
        ])
    }
    
    private func setupToggleButtonConstraints() {
        addSubview(toggleSearchViewButton)
        toggleSearchViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toggleSearchViewButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            toggleSearchViewButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            toggleSearchViewButton.leadingAnchor.constraint(equalTo: topSearchBar.trailingAnchor, constant: 10),
            toggleSearchViewButton.heightAnchor.constraint(equalToConstant: 35)
        
        ])
    }
    
    private func setupSearchButton() {
        addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: toggleSearchViewButton.bottomAnchor, constant: 18),
            searchButton.leadingAnchor.constraint(equalTo: bottomSearchBar.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }
    
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        ])
    }
    
    
    
}
