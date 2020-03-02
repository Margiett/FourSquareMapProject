//
//  SearchTableViewCell.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/26/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    public lazy var venueImageView : UIImageView = {
      let imageView = UIImageView()
      imageView.backgroundColor = .systemGray3
      imageView.contentMode = .scaleAspectFill
      return imageView
    }()
    
    public lazy var venueNameLabel : UILabel = {
      let label = UILabel()
      label.text = "Venue Name"
      label.font = label.font.withSize(20)
      label.textAlignment = .left
      return label
    }()
    
    public lazy var addressLabel : UILabel = {
      let label = UILabel()
      label.text = "Venue Address"
      label.textAlignment = .left
      return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      commonInit()
    }
     
    required init?(coder: NSCoder) {
      super.init(coder:coder)
    }
    
    
    private func commonInit() {
        configureVenueImage()
        configureVenueNameLabel()
        configureAddress()
    }
    
    func configureCell(venue: Venue) {
        venueNameLabel.text = venue.name
        addressLabel.text = venue.location.address
        
        
        
    }
    
    private func configureVenueImage() {
        addSubview(venueImageView)
        venueImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venueImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            venueImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            venueImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 5),
            venueImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    private func configureVenueNameLabel() {
        addSubview(venueNameLabel)
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venueNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            venueNameLabel.leadingAnchor.constraint(equalTo: venueImageView.trailingAnchor, constant: 10),
            venueNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func configureAddress() {
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: venueImageView.trailingAnchor, constant: 10),
            addressLabel.trailingAnchor.constraint(equalTo: venueNameLabel.trailingAnchor)
        ])
    }
    
    
}
