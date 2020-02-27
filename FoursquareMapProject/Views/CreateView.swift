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
    
}
