//
//  FaveDetailController.swift
//  FoursquareMapProject
//
//  Created by Margiett Gil on 2/28/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import DataPersistence

class FaveDetailController: UIViewController {

     let faveDatailViews = FaveDetail()
    private var venue: Venue
    private var dataPersistence: DataPersistence<Venue>
    
    init(_ dataPersistence: DataPersistence<Venue>, venues: Venue){
        self.dataPersistence = dataPersistence
        self.venue = venues
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = faveDatailViews
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown

       
    }
    private func loadVenue(){
        
       // VenueAPIClient.
    }
    

 

}
