//
//  FaveDetailController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/28/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence
import MapKit

class FaveDetailController: UIViewController {
    
    private let locationSession = CoreLocationSession()
    private var annotation = MKPointAnnotation()
    private var isShowingNewAnnotations = false
     private var selectedVenue: Venue
    
    var venueDetail = [Venue]()
    
    let faveDatailViews = FaveDetail()
    private var venue: Venue
    private var dataPersistence: DataPersistence<Venue>
    
    init(_ dataPersistence: DataPersistence<Venue>, venues: Venue){
        self.dataPersistence = dataPersistence
        self.venue = venues
        self.selectedVenue = venues
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = faveDatailViews
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        loadMap()
        getDirections()
        loadvenue()
    }
    
    private func loadvenue(){
        VenueAPIClient.getVenues(city: "New York", venue: "Pizza") { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let venues):
                self?.venueDetail = venues
                DispatchQueue.main.async {
                    self?.loadMap()
                }
            }
        }
    }
        
    private func loadMap() {
        let annotation = makeAnnotation(for: selectedVenue)
        faveDatailViews.venueMap.addAnnotation(annotation)
        getDirections()
    }
    
    private func makeAnnotation(for venue: Venue) -> MKPointAnnotation {
        selectedVenue = venue
        let annotation = MKPointAnnotation()
        
        let coordinate = CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)
        annotation.title = venue.name
        annotation.coordinate = coordinate
        
        isShowingNewAnnotations = true
        self.annotation = annotation
        return annotation
    }
    
    private func getDirections() {
        let coordinate = CLLocationCoordinate2D(latitude: selectedVenue.location.lat, longitude: selectedVenue.location.lng)
        let request = MKDirections.Request()
        request.source = MKMapItem.forCurrentLocation()
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        request.transportType = .any
        let directions = MKDirections(request: request)
        directions.calculate { //[unowned self]
            (response, error) in
            guard let unwrappedResponse = response else { return }
            for route in unwrappedResponse.routes {
                self.faveDatailViews.venueMap.addOverlay(route.polyline)
                self.faveDatailViews.venueMap.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    
    
    
    
    
}

extension FaveDetailController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "annotationView"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.tintColor = .black
            annotationView?.markerTintColor = .systemRed
            
        } else {
            annotationView?.annotation = annotation
            // annotationView?.canShowCallout = true
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        // renderer.fillColor = UIColor.black.withAlphaComponent(0.5)
        renderer.strokeColor = UIColor.systemBlue
        
        renderer.lineWidth = 3.0
        
        // renderer.lineDashPattern = [10]
        
        return renderer
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        if isShowingNewAnnotations {
            faveDatailViews.venueMap.showAnnotations([annotation], animated: false)
        }
        isShowingNewAnnotations = false
    }
}
