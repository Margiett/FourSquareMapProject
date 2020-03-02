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
        print("this")
        return scroll
    }()
    
    public lazy var contentView: UIView  = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    public lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    public lazy var nameLabel: UILabel = {
        let but = UILabel()
        but.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        but.text = "Venue Name"
        but.numberOfLines = 2
        but.textAlignment = .center
        but.font.withSize(CGFloat(30))
        return but
    }()
    
    public lazy var addressLabel: UILabel = {
        let but = UILabel()
        but.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        but.numberOfLines = 0
        but.textAlignment = .left
        but.font.withSize(CGFloat(20))
        return but
    }()
    
    public lazy var addressButton: UIButton = {
        let but = UIButton()
        but.backgroundColor = .black
        but.titleLabel?.text = "Get Directions"
        but.setTitleColor(.white, for: .normal)
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
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    
    private func nameConstraints(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func addresslLabelConstraints(){
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            addressLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func directionButConstraints(){
        addSubview(addressButton)
        addressButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        addressButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
        addressButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        addressButton.widthAnchor.constraint(equalToConstant: 90),
        addressButton.heightAnchor.constraint(equalToConstant: 40)
        ])
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


