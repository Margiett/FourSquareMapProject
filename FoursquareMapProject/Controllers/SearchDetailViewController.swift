//
//  VenueDetailViewController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence

class SearchDetailViewController: UIViewController {
    
    
    let detailView = SearchDetailView()
    private var dataPersistence: DataPersistence<Venue>
    var venue: Venue

//    var photo: Photo
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(favButtonPressed(_:)))
        

        
         detailView.addressButton.addTarget(self, action: #selector(addressButtonPressed(_:)), for: .touchUpInside)

    }
    
    init(_ dataPersistence: DataPersistence<Venue>, venue: Venue){
        
        self.dataPersistence = dataPersistence
        self.venue = venue
      
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillLayoutSubviews() {
        detailView.imageView.layer.cornerRadius = 10
        detailView.nameLabel.layer.cornerRadius = 10
        detailView.addressLabel.layer.cornerRadius = 10
        detailView.addressButton.layer.cornerRadius = 10
        detailView.detailsText.layer.cornerRadius = 10
    }
    override func loadView() {
        view = detailView
    }
    
    
    
    @objc func addressButtonPressed(_ sender: UIButton){
        
        
    }
    
//    @objc func backButtonPressed(_ sender: UIBarButtonItem){
//        
//        let searchController = SearchViewController(dataPersistence, userPreference: userPreference)()
//        navigationController?.pushViewController(searchController, animated: true)
//        
//    }
    
    
    @objc func favButtonPressed(_ sender: UIBarButtonItem){
        print("didSelectMoreButton: \(venue.name)")
            
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let saveAction = UIAlertAction(title: "Save", style: .default) { alertAction in
                self.saveVenue(self.venue)
            }
            alertController.addAction(cancelAction)
            alertController.addAction(saveAction)
            present(alertController, animated: true)
        }
        
//might need a dispatchQue main
        private func saveVenue(_ venue: Venue) {
        
            if !dataPersistence.hasItemBeenSaved(venue) {
        
                self.showAlert(title: "Unable to save", message: "This item has already been saved")
            } else {
                do {
                    // save to documents directory
                    try dataPersistence.createItem(venue)
                } catch {
                    print("error saving card: \(error)")
                }
            }
        }
    

    

    func updateUI(venue: Venue) {
             
               if let image = imageCache[venue.id] {
                detailView.imageView.image = image
                   return
               }
               
               VenueAPIClient.getImageURL(venueID: venue.id) { [weak self] (result) in
                
                       switch result {
                        
                       case .failure(let appError):
                        DispatchQueue.main.async {
                        print("could not retrieve image: \(appError)")
                        }
                       case .success(let imageData):
                        
                        let photo = imageData[0]
            
                 
                    let prefix = photo.prefix
                    let suffix = photo.suffix
                       let photoURL = "\(prefix)original\(suffix)"
                        print(photoURL)
                       self?.detailView.imageView.getImage(with: photoURL) { (result) in
                           switch result {
                           case .failure(_):
                               DispatchQueue.main.async {
                                   self?.detailView.imageView.image = UIImage(systemName: "map.fill")
                               }
                           case .success(let photo):
                               DispatchQueue.main.async {
                                   imageCache[venue.id] = photo
                                
                                   self?.detailView.imageView.image = photo
                               }
                           }
                       }
                   
                }

   // func updateUI() {
       // detailView.imageView.getImage(with: imageURL()  ) { [weak self] (result) in
         //   switch result {
        //    case .failure:
           //     DispatchQueue.main.async {
           //         self?.detailView.imageView.image = UIImage(named: "exclamation.mark.triangle")
          //      }
         //   case .success(let image):
          //      DispatchQueue.main.async {
            //        self?.detailView.imageView.image = image
                    
          //      }
      //      }
     //   }

        
//        detailView.textView.text = chosenBook.description
        
                self?.detailView.nameLabel.text = venue.name
        //detailView.addressLabel.text =
        
               //detailView.addressButton
        //detailView.phoneLabel.text =
               //detailView.phoneButton
       // detailView.detailsText.text =
    
    }
}
}
