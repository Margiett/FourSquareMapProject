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
        scroll.contentSize.height = 1000
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    public lazy var contentView: UIView  = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    public lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGroupedBackground
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    public lazy var nameLabel: UILabel = {
        let but = UILabel()
        but.backgroundColor = .systemGroupedBackground
        but.text = "Venue Name"
        but.numberOfLines = 0
        but.textAlignment = .center
        but.font.withSize(CGFloat(50))
        return but
    }()
    
    public lazy var addressLabel: UILabel = {
        let but = UILabel()
        but.backgroundColor = .systemGroupedBackground
        but.numberOfLines = 0
        but.textAlignment = .center
        but.font.withSize(CGFloat(30))
        return but
    }()
    
    public lazy var addressButton: UIButton = {
        let but = UIButton()
        but.backgroundColor = .systemGroupedBackground
        but.titleLabel?.text = "Get Directions"
        
        return but
    }()
    public lazy var saveButton: UIButton = {
        let but = UIButton()
        but.backgroundColor = .systemGroupedBackground
        but.titleLabel?.text = "Add to favorites"
        
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
        contentViewConstraint()
        imageConstrints()
        nameConstraints()
        saveButConstraints()
        addresslLabelConstraints()
        directionButConstraints()
        detailLabelConstraints()
    }
    
    
    private func scrollConstraints(){
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func contentViewConstraint() {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func imageConstrints(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    
    private func nameConstraints(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func saveButConstraints(){
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
        ])
    }
    
    
    private func addresslLabelConstraints(){
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            addressLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    
    private func directionButConstraints(){
        addSubview(addressButton)
        addressButton.translatesAutoresizingMaskIntoConstraints = false
        addressButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20).isActive = true
        addressButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        addressButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
    }
    
    
    
    private func detailLabelConstraints(){
        addSubview(detailsText)
        detailsText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsText.topAnchor.constraint(equalTo: addressButton.bottomAnchor, constant: 20),
            detailsText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            detailsText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            detailsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            detailsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
        ])
    }
    
}




