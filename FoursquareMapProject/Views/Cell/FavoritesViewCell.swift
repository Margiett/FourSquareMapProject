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
}

class FavoritesViewCell: GeminiCell {
    
    private var currentVenue: Map!
    
    public lazy var venueImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo.fill")
        iv.contentMode = .scaleToFill
        iv.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return iv
    }()
    
    public lazy var selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.isHidden = true
        return view
    }()
    
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
        
    }
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(tapGestureAction(gesture:)))
        return gesture
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addGestureRecognizer(tapGesture)
    }
    
    //MARK: TODO CongigureCell & setup constraints 
    
    @objc
    private func tapGestureAction(gesture: UITapGestureRecognizer) {
        if gesture.state == .began {
            gesture.state = .cancelled
            return
        }
        geminiDelegate?.tapGesture(self, venue: currentVenue)
    }
    
}
