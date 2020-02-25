//
//  CollectionViewController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence

class FavoritesViewController: UIViewController {
    
    private var dataPersistence: DataPersistence<Map>
    private var userPreference: UserPreference
    
    let collectionView = FavoritesView()
    
    private var venues = [Map]() {
        didSet{
            collectionView.geminiCollectionView.reloadData()
            if venues.isEmpty {
                collectionView.geminiCollectionView.backgroundView = EmptyView(title: "Venue Name", message: "There are curretly no saved venues in your favorite collection view.")
            } else {
                view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    
    init(dataPersistence: DataPersistence<Map>,userPreference: UserPreference) {
        self.dataPersistence = dataPersistence
        self.userPreference = userPreference
        super.init(nibName: nil, bundle: nil)
        // self.userPreference.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init couldnt be implemented")
    }
    
    
    override func loadView() {
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.geminiCollectionView.dataSource = self
        collectionView.geminiCollectionView.delegate = self
        collectionView.geminiCollectionView.register(FavoritesViewCell.self, forCellWithReuseIdentifier: "geminiVenueCell")
        navigationItem.title = "Favorite Venues"
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        circleRotation()
        
    }
    private func getSavedVenues() {
        do{
            venues = try dataPersistence.loadItems().reversed()
            dataPersistence.synchronize(venues)
        } catch {
            showAlert(title: "There was an error loading the venues", message: "Error: \(error)")
        }
    }
    
    private func circleRotation(){
        collectionView.geminiCollectionView.gemini
            .circleRotationAnimation()
            .radius(450) // The radius of the circle
            .rotateDirection(.clockwise) // Direction of rotation.
            .itemRotationEnabled(true) // Whether the item rotates or not.
        
        //view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    }
    
    
    
    
}
extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.75
        let itemHeight: CGFloat = maxSize.height * 0.70
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "geminiVenueCell", for: indexPath) as? FavoritesViewCell else {
            fatalError("could not deque cell")
        }
        cell.selectedView.isHidden = true
        let venue = venues[indexPath.row]
        
        cell.layoutIfNeeded()
        
        
        
        
    }
}
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let geminiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "geminiVenueCell", for: indexPath) as? FavoritesViewCell else {
            fatalError("could not deque cell")
        }
        let venue = venues[indexPath.row]
        
        
        return geminiCell
    }
}
extension FavoritesViewController: GeminiCellDelegate {
    func moreButtonPressed(_ CollectionViewCell: FavoritesViewCell, venue: Map) {
         let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                   
                   let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] (alertAction) in
                       self?.deleteVenue(venue)
                       self?.getSavedVenues()
                   }
                   let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                   let actionVenue = [deleteAction, cancelAction]
                   actionVenue.forEach { action.addAction($0)}
                   present(action, animated: true, completion: nil)
    }
    
    
    private func deleteVenue(_ foodVenue: Map){
        guard let index = venues.firstIndex(of: foodVenue) else {
            return
        }
        do {
            try dataPersistence.deleteItem(at: index)
        } catch {
            showAlert(title: "There is an error when deleting", message: "Error: \(error)")
        }
    }
    
    
    
    func tapGesture(_ imageCell: FavoritesViewCell, venue: Map) {
        print("Testing if delegate is working")
        
        guard let indexPath = collectionView.geminiCollectionView.indexPath(for: imageCell)
            else {
                return
        }
        let alterController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        present(alterController, animated:  true)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] alterAction in
            self?.deleteVenue(venue)
            self?.venues.remove(at: indexPath.row)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alterController.addAction(deleteAction)
        alterController.addAction(cancelAction)
        
    
        
    }
}


