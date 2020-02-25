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
    func tapGesture(_ imageCell: FavoritesViewCell, venue: Map)
    func moreButtonPressed(_ CollectionViewCell: FavoritesViewCell, venue: Map)
    
}

class FavoritesViewCell: GeminiCell {
    
    private var currentVenue: Map!
    weak var delegate: GeminiCellDelegate!
    
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
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return iv
    }()
    
    public lazy var venueName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.text = "Venue Name"
        return label
        
    }()
    
    public lazy var venueDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.text = "Venue Description"
        label.isUserInteractionEnabled = true 
        return label
        
    }()
    
    public lazy var selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        view.isHidden = true
        return view
    }()
    
    private var isBackOfCardShowing = false
    weak var geminiDelegate: GeminiCellDelegate?
    
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
        setupEditButtonConstraints()
        setupSelectedViewConstraints()
        setupVenueName()
        setupVenueDescription()
        
        addGestureRecognizer(tapGesture)
    }
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(tapGestureAction(_ :)))
        return gesture
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addGestureRecognizer(tapGesture)
    }
    
    //MARK: TODO CongigureCell & setup constraints
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
    
    private func setupVenueName(){
        addSubview(venueName)
        venueName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            venueName.centerXAnchor.constraint(equalTo: centerXAnchor),
            venueName.centerYAnchor.constraint(equalTo: centerYAnchor),
            venueName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            venueName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
        
        ])
    }
    private func setupVenueDescription(){
        addSubview(venueDescription)
        venueDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            venueDescription.topAnchor.constraint(equalTo: topAnchor),
            venueDescription.leadingAnchor.constraint(equalTo: leadingAnchor),
            venueDescription.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        
        ])
    }
    //MARK: TODO waiting on model to finish configureCell
       public func configureCell(for card: Map){
       //        currentVenue = card
    
       //        venueName.text =
          }
    @objc
    public func editButtonPressed(){
        delegate.moreButtonPressed(self, venue: currentVenue)
    }
    @objc
    private func tapGestureAction(_ gesture: UITapGestureRecognizer) {
        guard currentVenue != nil else { return }
        if gesture.state == .began || gesture.state == .changed {
            print("testing gesture")
            return
        }
        isBackOfCardShowing.toggle()
        geminiDelegate?.tapGesture(self, venue: currentVenue)
        animate()
        
    }
    private func animate(){
        let duration = 1.0
        
        if isBackOfCardShowing {
            UIView.transition(with: self, duration: duration, options:
                [ .transitionFlipFromLeft], animations: {
                    self.venueImageView.alpha = 1.0
                    self.venueName.alpha = 0.0
                    self.venueDescription.alpha = 0.0
            }, completion: nil)
        } else {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
                self.venueImageView.alpha = 0.0
                self.venueName.alpha = 1.0
                self.venueDescription.alpha = 1.0
                
            }, completion: nil)
        }
    }
    
   
    
}
