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
    
    private var dataPersistence: DataPersistence<Venue>
    
     var userPreference: UserPreference
    
    init(_ dataPersistence: DataPersistence<Venue>,userPreference: UserPreference ){
             
             self.dataPersistence = dataPersistence
             self.userPreference = userPreference
             super.init(nibName: nil, bundle: nil)
         }
         
         required init?(coder: NSCoder) {
     
             fatalError("init(coder:) has not been implemented")
         }
    
    
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
    
    private var allPhotos = [UIImage]()
    
  
    
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
                DispatchQueue.main.async {
                self.showAlert(title: "No Venue Found", message: "Please check your spelling and try again.")
                print("error getting venue: \(appError)")
                }
            case .success(let data):
                DispatchQueue.main.async {
                    if venue.count == 0 {
                        self.showAlert(title: "Not Found", message: "There are no \(venue) in this area.")
                    } else {
                        self.allLocations = data
                        self.loadMapAnnotation()
                    }
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
        allLocations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else {
            fatalError()
        }
        let location = allLocations[indexPath.row]
        cell.backgroundColor = .white
        cell.configureCell(venue: location)
        var allPhotosArray = [UIImage]()
        allPhotos.append(cell.imageView.image ?? UIImage(systemName: "map.fill")!)
        allPhotos = allPhotosArray
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
