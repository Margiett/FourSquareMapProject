//
//  CollectionViewCell.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import Gemini
import ImageKit


protocol GeminiCellDelegate: AnyObject {
    //func longPressGesture(_ imageCell: FavoritesViewCell, venue: Map)
    func moreButtonPressed(_ CollectionViewCell: FavoritesViewCell)
    
}

class FavoritesViewCell: GeminiCell {
    
    private var currentVenue: PhototSearch!
    
    
    weak var geminiDelegate: GeminiCellDelegate?
    
    lazy var editButton: UIButton = {
        let editButton = UIButton()
        //editButton.backgroundColor = .black
        editButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        return editButton
        
    }()
    
    public lazy var venueImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo.fill")
        iv.contentMode = .scaleToFill
        iv.isUserInteractionEnabled = false
        
        iv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return iv
    }()
    
    
    public lazy var selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.isHidden = true
        return view
    }()
    
    public lazy var categoryLabel: UILabel = {
        let layout = UILabel()
        layout.text = "Category Name"
        layout.font = UIFont.preferredFont(forTextStyle: .headline)
        layout.numberOfLines = 2
        layout.textAlignment = .center
        return layout
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
        setupImageConstraints()
        setupCategoryLabel()
        setupEditButtonConstraints()
        setupSelectedViewConstraints()
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: TODO waiting on model to finish configureCell
    public func configureCell(venue: Venue){
        categoryLabel.text = venue.name
        VenueAPIClient.getImageURL(venueID: venue.id) { (result) in
            switch result {
              
            case .failure(let appError):
              DispatchQueue.main.async {
                print("could not retrieve image: \(appError)")
              }
            case .success(let imageData):
              
                DispatchQueue.main.async {
              let photo = imageData.first
              guard let prefix = photo?.prefix,
                let suffix = photo?.suffix else {return}
              let photoURL = "\(prefix)original\(suffix)"
              print(photoURL)
                
              
              self.venueImageView.getImage(with: photoURL) { (result) in
                switch result {
                case .failure(_):
                  DispatchQueue.main.async {
                    self.venueImageView.image = UIImage(systemName: "map.fill")
                  }
                case .success(let photo):
                  DispatchQueue.main.async {
                    imageCache[venue.id] = photo
                    
                    self.venueImageView.image = photo
                  }
                }
                }
              }
            }
            
        }
        
        
    }
    
    
    @objc
    public func editButtonPressed(){
        geminiDelegate?.moreButtonPressed(self)
    }
    
    
    
    //MARK: Constraints
    private func setupEditButtonConstraints(){
        addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: topAnchor),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            editButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
            editButton.widthAnchor.constraint(equalTo: editButton.heightAnchor)
            
        ])
    }
    
    private func setupImageConstraints(){
        addSubview(venueImageView)
        venueImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            venueImageView.topAnchor.constraint(equalTo: topAnchor),
            venueImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            venueImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            venueImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    private func setupCategoryLabel(){
        addSubview(categoryLabel)
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: venueImageView.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    private func setupSelectedViewConstraints(){
        addSubview(selectedView)
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectedView.centerXAnchor.constraint(equalTo: venueImageView.centerXAnchor),
            selectedView.centerYAnchor.constraint(equalTo: venueImageView.centerYAnchor),
            selectedView.widthAnchor.constraint(equalTo: venueImageView.widthAnchor, multiplier: 0.75),
            selectedView.heightAnchor.constraint(equalTo: venueImageView.heightAnchor, multiplier: 0.75)
            
        ])
    }
}





