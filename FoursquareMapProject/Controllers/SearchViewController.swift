//
//  SearchViewController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence
import MapKit
import CoreLocation

class SearchViewController: UIViewController {
    
    
    let searchView = SearchView()
    
    private var dataPersistence: DataPersistence<Venue>?
    
    private var userPreference: UserPreference?
    
    private let coreLocation = CoreLocationSession()
    
    private var annotation = [MKAnnotation]()
    
    private var isShowingAnnotations = false
    
    private var allLocations = [Venue]() {
        didSet{
            DispatchQueue.main.async {
                self.searchView.collectionView.reloadData()
            }
        }
    }
    
    private var allPhotos = [Photo]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = searchView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchView.collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
        searchView.topSearchBar.delegate = self
        searchView.bottomSearchBar.delegate = self
        searchView.mapView.showsUserLocation = true
        searchView.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        loadMapAnnotation()
        
    }
    
    
    private func convertPlaceNameToCoordinate(_ placeName: String) {
        coreLocation.convertPlaceNameToCoordinate(addressString: placeName)
        { (result) in
            switch result {
            case .failure(let error):
                print("geocoding error \(error)")
            case .success(let coordinate):
                print("coordinate: \(coordinate)")
                // set map view at given coordinate
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1600, longitudinalMeters: 1600)
                self.searchView.mapView.setRegion(region, animated: true)
            }
        }
    }
    
    
    private func loadVenues(city: String, venue: String) {
        VenueAPIClient.getVenues(city: city, venue: venue, completion: { (result) in
            switch result {
            case .failure(let appError):
                print("error getting venue: \(appError)")
            case .success(let data):
                DispatchQueue.main.async {
                    self.allLocations = data
                    self.loadMapAnnotation()
                }
            }
        }
        )}
    
    
    private func makeAnnotations() -> [MKPointAnnotation] {
        var annotations = [MKPointAnnotation]()
        for location in allLocations {
            let latitude = Double(location.location.lat)
            let longitude = Double(location.location.lng)
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            print("coordinate func makeAnnotations: \(coordinate)")
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = location.name
            annotations.append(annotation)
        }
        dump(annotations)
        return annotations
    }
    
    
    
    func loadMapAnnotation() {
        let annotations = makeAnnotations()
        searchView.mapView.addAnnotations(annotations)
        searchView.mapView.showAnnotations(annotations, animated: true)
    }
    
    
    
    
    
    
    @objc private func searchButtonPressed() {
        guard let searchLocationText = searchView.bottomSearchBar.text else {
            return
        }
        guard let searchVenueText = searchView.topSearchBar.text else {
            return
        }
        convertPlaceNameToCoordinate(searchLocationText)
        loadVenues(city: searchLocationText, venue: searchVenueText)
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

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
}


extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text,
            !searchText.isEmpty else {
                return true
        }
       // convertPlaceNameToCoordinate(searchText)
        return true
    }
    
}


extension SearchViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("didSelect")
    }
    
    
    
}
