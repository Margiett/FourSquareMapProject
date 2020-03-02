//
//  CollectionViewController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence
import AVFoundation

protocol ImagePhoto: AnyObject {
    func getImageData(_ image: UserCollection)
}



class FavoritesViewController: UIViewController {
    
    private var dataPersistence: DataPersistence<Venue>
    
    
    private var userPreference: UserPreference
    
    
    public var selectedImage: UserCollection?
    public var persistence = DataPersistence<UserCollection>(filename: "images.plist")
    public var isNewPhoto = false
    weak var imageDelegate: ImagePhoto?
    
    
    let faveCollectionViews = FavoritesView()
    
    private var venues = [Venue]() {
        didSet{
            faveCollectionViews.geminiCollectionView.reloadData()
            if venues.isEmpty {
                faveCollectionViews.geminiCollectionView.backgroundView = EmptyView(title: "Venue Name", message: "There are curretly no saved venues in your favorite collection view.")
            } else {
                view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
            }
        }
    }
    
    private var userCollection = [UserCollection]()
    
    init(dataPersistence: DataPersistence<Venue>,userPreference: UserPreference) {
        self.dataPersistence = dataPersistence
        self.userPreference = userPreference
        super.init(nibName: nil, bundle: nil)
        dataPersistence.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init couldnt be implemented")
    }
    
    
    override func loadView() {
        view = faveCollectionViews
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        faveCollectionViews.geminiCollectionView.dataSource = self
        faveCollectionViews.geminiCollectionView.delegate = self
        faveCollectionViews.geminiCollectionView.register(FavoritesViewCell.self, forCellWithReuseIdentifier: "geminiVenueCell")
        circleRotation()
        navigationItem.title = "Favorite Venues"
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        faveCollectionViews.geminiCollectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        getSavedVenues()
        configureNavBar()
        
    }
    
    private func configureNavBar() {
        self.navigationItem.title = "My Collection"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(pressButton))
    }
    
    @objc
    private func pressButton() {
        let addCollectionController = CreateViewController(dataPersistence: dataPersistence, userPreference: userPreference)
        navigationController?.pushViewController(addCollectionController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
        
        faveCollectionViews.geminiCollectionView.gemini
            .circleRotationAnimation()
            .radius(900) // The radius of the circle
            .rotateDirection(.anticlockwise) // Direction of rotation.
            .itemRotationEnabled(true) // Whether the item rotates or not.
    }
    
    private func showAddPhotoVC(_ photo: UserCollection? = nil) {
        
        guard let createPhotoController = storyboard?.instantiateViewController(identifier: "AddPhotoController") as? CreateViewController else {
            fatalError("could not downcast to AddPhotoController")
        }
        createPhotoController.photosDelegate = self
        if !isNewPhoto {
            guard let photoData = photo?.pickedImage else {return}
            createPhotoController.selectedImage = UIImage(data: photoData)
            createPhotoController.originalPhoto = photo
        }
        present(createPhotoController, animated: true)
    }

    
}


//MARK: Extensions

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
        cell.configureCell(venue: venue)
        cell.geminiDelegate = self
        let location = Location(address: venue.location.address, crossStreet: venue.location.crossStreet, lat: 9.0, lng: 9.0, postalCode: venue.location.postalCode, cc: "nbfnjdfn", city: "dngjlgns", state: "fngnf", country: venue.location.country, formattedAddress: [venue.location.formattedAddress[0],venue.location.formattedAddress[1]])
        let icon = Icon(prefix: "", suffix: "nvlksdfnl")
        let cat = [Category(name: "gnfkongjk", icon: icon)]
        let venueInfo = Venue(id: venue.id, name: venue.name, location: location, categories: cat)
        let venueDetailVC = FaveDetailController(dataPersistence, venues: venue)
        self.present(venueDetailVC, animated:  true)
        faveCollectionViews.geminiCollectionView.alpha = 0.15
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
         let food = venues[indexPath.row]
        faveCollectionViews.geminiCollectionView.animateCell(geminiCell)
        geminiCell.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        geminiCell.geminiDelegate = self
        geminiCell.configureCell(venue: food)
        return geminiCell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        faveCollectionViews.geminiCollectionView.animateVisibleCells()
        faveCollectionViews.geminiCollectionView.alpha = 1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let cell = cell as? FavoritesViewCell {
            faveCollectionViews.geminiCollectionView.animateCell(cell)
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
    func moreButtonPressed(_ CollectionViewCell: FavoritesViewCell) {
        print("testing is delegate is working !!! ")
        
        let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] (alertAction) in
            //self?.deleteVenue
            self?.getSavedVenues()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let actionVenue = [deleteAction, cancelAction]
        actionVenue.forEach { action.addAction($0)}
        present(action, animated: true, completion: nil)
    }
    
    
    private func deleteVenue(_ foodVenue: Venue){
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

extension FavoritesViewController: AddPhotoToCollection {
    func updateCollectionView(images: UserCollection) {
        
    }
    
    
}
