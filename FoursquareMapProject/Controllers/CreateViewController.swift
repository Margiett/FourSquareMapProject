//
//  CreateViewController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/27/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence
import AVFoundation

protocol AddPhotoToCollection: AnyObject {
    func updateCollectionView(images: UserCollection)
 
}

class CreateViewController: UIViewController {
    
    private var dataPersistence: DataPersistence<Venue>
    
    private var userPreference: UserPreference
    
    weak var photosDelegate: AddPhotoToCollection?
    
    public var originalPhoto: UserCollection?
    
    public var selectedImage: UIImage?
    
    private let imagePickerController = UIImagePickerController()
    
    public var imageDescription = String()
    
    private let createView = CreateView()
    
    override func loadView() {
        view = createView
    }
    init(dataPersistence: DataPersistence<Venue>,userPreference: UserPreference) {
        self.dataPersistence = dataPersistence
        self.userPreference = userPreference
        super.init(nibName: nil, bundle: nil)
        // self.userPreference.delegate = self as? UserPreferenceDelegate
    }
    required init?(coder: NSCoder) {
        fatalError("init couldnt be implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        configureNavBar()
        //imagePickerController.delegate = self
        
    }
    
    
    
    private func configureNavBar()  {
        self.title = "Add to or Create Collection"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(xButtonPressed))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createButtonPressed))
    }
    
    @objc
    private func xButtonPressed()   {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func createButtonPressed()  {
        print("pressed")
    }
    func getImageData(_ image: UserCollection) {
        self.createView.libImage.image = UIImage(data: image.pickedImage)
        print(image.collectionName)
        print("Testing to see if we are getting image data")
    }
    
}


//MARK: Extentions

extension CreateViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != "" && createView.libImage.image != nil {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
        imageDescription = textField.text ?? "No Category Name was entered"
        print("no name was entered testing !!")
        return true
    }
}

