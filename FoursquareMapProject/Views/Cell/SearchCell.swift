//
//  SearchCollectionViewCell.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit


// can improve by defining a class and creating a static var
//dependancy injection
var imageCache = [String: UIImage]()

class SearchCell: UICollectionViewCell {
    
    var allPhotos = [Photo]()
    
    public lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public lazy var venueNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Venue Name"
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    public lazy var addressLabel : UILabel = {
        let label = UILabel()
        label.text = "Venue Address"
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
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
        configureImage()
        configureVenueNameLabel()
        configureAddress()
    }
    
    
    
    func configureCell(venue: Venue) {
        venueNameLabel.text = venue.name
        addressLabel.text = venue.location.address
        
        // cache images so it doesnt call the API again
        if let image = imageCache[venue.id] {
            imageView.image = image
            return
        }
        
        VenueAPIClient.getImageURL(venueID: venue.id) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    print("could not retrieve image: \(appError)")
                case .success(let imageView):
                    self?.allPhotos = imageView
                }
            }
            
            DispatchQueue.main.async {
                let prefix = self?.allPhotos.first?.prefix ?? ""
                let suffix = self?.allPhotos.first?.suffix ?? ""
                let photoURL = "\(prefix)original\(suffix)"
                self?.imageView.getImage(with: photoURL) { (result) in
                    switch result {
                    case .failure(_):
                        DispatchQueue.main.async {
                            self?.imageView.image = UIImage(systemName: "map.fill")
                        }
                    case .success(let photo):
                        DispatchQueue.main.async {
                            imageCache[venue.id] = photo
                            self?.imageView.image = photo
                        }
                    }
                }
            }
        }
    }
    
    
    private func configureImage() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureVenueNameLabel() {
        addSubview(venueNameLabel)
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venueNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            venueNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            venueNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func configureAddress() {
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            addressLabel.trailingAnchor.constraint(equalTo: venueNameLabel.trailingAnchor)
        ])
    }
    
    
    
    
}
