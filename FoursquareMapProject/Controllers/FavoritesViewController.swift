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
    private var arr = ["cat", "dog", "bird"]
    
    let collectionViews = FavoritesView()
    
    private var venues = [Map]() {
        didSet{
            collectionViews.geminiCollectionView.reloadData()
            if venues.isEmpty {
                collectionViews.geminiCollectionView.backgroundView = EmptyView(title: "Venue Name", message: "There are curretly no saved venues in your favorite collection view.")
            } else {
                view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    
    init(dataPersistence: DataPersistence<Map>,userPreference: UserPreference) {
        self.dataPersistence = dataPersistence
        self.userPreference = userPreference
        super.init(nibName: nil, bundle: nil)
        //self.userPreference.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init couldnt be implemented")
    }
    
    
    override func loadView() {
        view = collectionViews
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViews.geminiCollectionView.dataSource = self
        collectionViews.geminiCollectionView.delegate = self
        collectionViews.geminiCollectionView.register(FavoritesViewCell.self, forCellWithReuseIdentifier: "geminiVenueCell")
        navigationItem.title = "Favorite Venues"
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        circleRotation()
        getSavedVenues()
        
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
        collectionViews.geminiCollectionView.gemini
            .circleRotationAnimation()
            .radius(400) // The radius of the circle
            .rotateDirection(.anticlockwise) // Direction of rotation.
            .itemRotationEnabled(true) // Whether the item rotates or not.
        
        //view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    }
    
    
    
    
}
extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItem: CGFloat = 8
        let numberOfItems: CGFloat = 1
        let itemWidth: CGFloat = maxSize.width * 0.55
        let itemHeight: CGFloat = maxSize.height * 0.50
        let totalSpacing: CGFloat = (2 * spacingBetweenItem) + (numberOfItems - 1) * spacingBetweenItem
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "geminiVenueCell", for: indexPath) as? FavoritesViewCell else {
////            fatalError("could not deque cell")
////        }
//      //  cell.selectedView.isHidden = true
//       // let venue = venues[indexPath.row]
//
//      //  cell.layoutIfNeeded()
//
//
//
//
//    }
}
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
            //venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let geminiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "geminiVenueCell", for: indexPath) as? FavoritesViewCell else {
            fatalError("could not deque cell")
        }
        //let food = venues[indexPath.row]
        collectionViews.geminiCollectionView.animateCell(geminiCell)
        geminiCell.geminiDelegate = self
        geminiCell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        //geminiCell.configureCell(for: food)
    
        return geminiCell
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        collectionViews.geminiCollectionView.animateVisibleCells()
        collectionViews.geminiCollectionView.alpha = 1
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let cell = cell as? FavoritesViewCell {
            collectionViews.geminiCollectionView.animateCell(cell)
        }
    
    }
}

extension FavoritesViewController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        getSavedVenues()
    }
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        getSavedVenues()
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

    
//    func longPressGesture(_ imageCell: FavoritesViewCell, venue: Map) {
//        print("Testing if delegate is working")
//        
//        guard let indexPath = collectionViews.geminiCollectionView.indexPath(for: imageCell)
//            else {
//                return
//        }
//        let alterController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        present(alterController, animated:  true)
//        
//        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] alterAction in
//            self?.deleteVenue(venue)
//            self?.venues.remove(at: indexPath.row)
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        
//        alterController.addAction(deleteAction)
//        alterController.addAction(cancelAction)
//        
//    }
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
}


