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
    func editPhoto(original: UserCollection, newPhoto: UserCollection)
}


class CreateViewController: UIViewController {
    
    private var dataPersistence: DataPersistence<Venue>
    private var userPreference: UserPreference
    weak var photosDelegate: AddPhotoToCollection?
    public var originalPhoto: UserCollection?
    public var selectedImage: UIImage?
    
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

    }
    
  
    
    private func configureNavBar()  {
        self.title = "Add to or Create Collection"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(xButtonPressed))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createButtonPressed))
    }
    
    @objc private func xButtonPressed()   {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func createButtonPressed()  {
        print("pressed")
    }

}


extension CreateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        //if textField.text != "" && photoImage.image != nil {
         //   saveButton.isEnabled = true
       // }
       // imageDescription = textField.text ?? "no photo description"
//        print(photoImage.image?.description)
        return true
    }

}

extension CreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("image selected not found")
            return
        }
       // selectedImage = image
        //photoImage.image = image
        dismiss(animated: true)
    }
}

extension UIImage {
    func resizeImage(to width: CGFloat, height: CGFloat) -> UIImage {
        let size = CGSize(width: width, height: height)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
