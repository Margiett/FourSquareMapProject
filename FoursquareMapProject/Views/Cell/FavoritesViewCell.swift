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
    
    private var currentVenue: Map!
 
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
   
        iv.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return iv
    }()
    
    
    public lazy var selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        view.isHidden = true
        return view
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
        setupEditButtonConstraints()
        setupSelectedViewConstraints()
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: TODO waiting on model to finish configureCell
       public func configureCell(for card: Map){
       //        currentVenue = card
    
       //        venueName.text =
          }
    
    
    @objc
      public func editButtonPressed(){
          geminiDelegate?.moreButtonPressed(self)
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
}

    
    
   
    
