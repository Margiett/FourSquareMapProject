//
//  CreateView.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/27/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

protocol CreateFullDelegate: AnyObject {
    func addButtonPress(_ createCategory: CreateView)
}

class CreateView: UIView {
    
    weak var buttonDelegate: CreateFullDelegate?

    public lazy var collectionNameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Create Category"
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        return nameTextField
    }()
    
    public lazy var libImage: UIImageView = {
        let iv = UIImageView()
               iv.image = UIImage(systemName: "photo.fill")
               iv.contentMode = .scaleToFill
               iv.isUserInteractionEnabled = false
               
               iv.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
               return iv
    }()
   
    
    public lazy var addPhoto: UIButton = {
        let ab = UIButton()
        //editButton.backgroundColor = .black
        ab.setImage(UIImage(systemName: "photo"), for: .normal)
        //ab.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        return ab
    }()
    
    public lazy var takePhoto: UIButton = {
        let tb = UIButton()
        tb.setImage(UIImage(systemName: "camera.on.rectangle"), for: .normal)
        return tb
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
         setupTextField()
         setupImage()
       }
    
    
    
    
    private func setupTextField() {
        addSubview(collectionNameTextField)
        collectionNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionNameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            collectionNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
        ])
    }
    
    private func setupImage() {
        addSubview(libImage)
        libImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            libImage.topAnchor.constraint(equalTo: collectionNameTextField.bottomAnchor, constant: 20),
            libImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            libImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            libImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        
        
        ])
    }
    
}
