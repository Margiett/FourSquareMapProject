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
    var photo: Photo
    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(favButtonPressed(_:)))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "backward"), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        updateUI()
        
         detailView.addressButton.addTarget(self, action: #selector(addressButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    init(_ dataPersistence: DataPersistence<Venue>, venue: Venue, photo: Photo){
        
        self.dataPersistence = dataPersistence
        self.venue = venue
        self.photo = photo
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
    
    @objc func backButtonPressed(_ sender: UIBarButtonItem){
        
        let searchController = SearchViewController()
        navigationController?.pushViewController(searchController, animated: true)
        
    }
    
    @objc func favButtonPressed(_ sender: UIBarButtonItem){

               do {

                   try dataPersistence.createItem(venue)
                   DispatchQueue.main.async {
                       self.showAlert(title: "Saved", message: "Venue has been added to favorites")
                   }

               } catch {
                   print("error saving article: \(venue)")
               }
       }
    
    func imageURL() -> String{
        let imageUrl = "\(photo.prefix)300*300\(photo.suffix)"
              return imageUrl
    }
    
    func updateUI() {
        detailView.imageView.getImage(with: imageURL()  ) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.detailView.imageView.image = UIImage(named: "exclamation.mark.triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailView.imageView.image = image
                    
                }
            }
        }
        
//        detailView.textView.text = chosenBook.description
        
        detailView.nameLabel.text = venue.name
        //detailView.addressLabel.text =
        
               //detailView.addressButton
        //detailView.phoneLabel.text =
               //detailView.phoneButton
       // detailView.detailsText.text =
    
    }
}
