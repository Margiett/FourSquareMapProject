//
//  FaveTableView.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/27/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import MapKit
import ImageKit



class FaveDetail: UIView {
    
    public lazy var venueName: UILabel = {
        let layout = UILabel()
        layout.text = "Venue Name"
        layout.font = UIFont.preferredFont(forTextStyle: .headline)
        layout.numberOfLines = 2
        layout.textAlignment = .center
        return layout
    }()
    
    public lazy var venuePhoto: UIImageView = {
        let vImages = UIImageView()
        vImages.contentMode = .scaleToFill
        vImages.image = UIImage(systemName: "photo.fill")
        vImages.backgroundColor = .blue
        return vImages
        
    }()
    
    public lazy var venueLocation: UILabel = {
        let vl = UILabel()
        vl.text = "location"
        vl.font = UIFont.preferredFont(forTextStyle: .headline)
        vl.numberOfLines = 4
        vl.textAlignment = .center
        return vl
        
    }()
    
    public lazy var venueMap: MKMapView = {
        let map = MKMapView()
        return map
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
        setupVenueName()
        setupVenuImage()
        setupLoction()
        setupMap()
    }
    
    private func setupVenueName(){
        addSubview(venueName)
        venueName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venueName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            venueName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            venueName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
        
    }
    
    private func setupVenuImage(){
        addSubview(venuePhoto)
        venuePhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venuePhoto.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 8),
            venuePhoto.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            venuePhoto.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant:  -8),
            venuePhoto.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func setupLoction(){
        addSubview(venueLocation)
        venueLocation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venueLocation.topAnchor.constraint(equalTo: venuePhoto.bottomAnchor, constant: 8),
            venueLocation.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            venueLocation.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
    
    private func setupMap(){
        addSubview(venueMap)
        venueMap.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venueMap.topAnchor.constraint(equalTo: venueLocation.bottomAnchor, constant: 20),
            venueMap.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            venueMap.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            venueMap.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8)
        ])
    }
    
    
}


