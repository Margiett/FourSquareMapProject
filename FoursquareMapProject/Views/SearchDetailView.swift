//
//  DetailView.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class SearchDetailView: UIView {

   public lazy var scrollView: UIScrollView = {
            let scroll = UIScrollView()
            scroll.backgroundColor = .systemBackground
            scroll.contentSize.height = 10000
    
            scroll.isScrollEnabled = true
            return scroll
        }()
        
        public lazy var imageView: UIImageView = {
            let view = UIImageView()
            view.backgroundColor = .cyan
            view.contentMode = .scaleAspectFill
            return view
        }()
        
        public lazy var nameLabel: UILabel = {
            let but = UILabel()
            but.backgroundColor = .red
            but.text = "Venue Name"
            but.numberOfLines = 2
            but.textAlignment = .center
            but.font.withSize(CGFloat(30))
           return but
        }()
        
        public lazy var addressLabel: UILabel = {
            let but = UILabel()
            but.backgroundColor = .purple
            but.numberOfLines = 7
            but.textAlignment = .left
            but.font.withSize(CGFloat(20))
           return but
        }()
        
        public lazy var addressButton: UIButton = {
            let but = UIButton()
            but.backgroundColor = .cyan
            but.titleLabel?.text = "Get Directions"
            
           return but
        }()
        
   
    public lazy var detailsText: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Decription, Details, Reviews"
        return label
    }()
        
        
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        private func commonInit(){
            scrollConstraints()
//            imageConstrints()
//            nameConstraints()
        }
        

        private func scrollConstraints(){
            
            addSubview(scrollView)
            
            //not sure if this is correct
            scrollView.addSubview(imageView)
            scrollView.addSubview(nameLabel)
            scrollView.addSubview(addressLabel)
            scrollView.addSubview(addressButton)
            scrollView.addSubview(detailsText)
            
            
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            //added this as well it won't scroll
            imageConstrints()
            nameConstraints()
            addresslLabelConstraints()
            directionButConstraints()
            detailLabelConstraints()
        }
        
        
        private func imageConstrints(){
//            addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([

                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
                imageView.heightAnchor.constraint(equalToConstant: 600),
                imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
            ])
        }
    private func nameConstraints(){
        
//        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
        nameLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func addresslLabelConstraints(){
        
//        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            addressLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
           addressLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
        
        ])
    }
    
        private func directionButConstraints(){
//            addSubview(addressButton)
            addressButton.translatesAutoresizingMaskIntoConstraints = false
            addressButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20).isActive = true
            addressButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
    
        }
    

    
    private func detailLabelConstraints(){
          
//          addSubview(detailsText)
          detailsText.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              detailsText.topAnchor.constraint(equalTo: addressButton.bottomAnchor, constant: 20),
             detailsText.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
           detailsText.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
              detailsText.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
               detailsText.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8),
          
          ])
      }
    
    }




