//
//  APIClient.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/24/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
import NetworkHelper



struct VenueAPIClient{
    static func getVenues(city: String, venue: String, completion: @escaping (Result <[Venue],AppError>) -> ()){
        
        let cityFinal = city.lowercased().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let venueFinal = venue.lowercased().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let newEndpointURL = "https://api.foursquare.com/v2/venues/search?client_id=\(APIKeys.ClientId)&client_secret=\(APIKeys.ClientSecret)&v=20210102&near=\(cityFinal)&intent=browse&radius=1500&query=\(venueFinal)&limit=25"
        
        guard let url = URL(string: newEndpointURL) else {
            completion(.failure(.badURL(newEndpointURL)))
            return
        }
        
        print(url)
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
                
            case .success(let data):
                do{
                    let search = try JSONDecoder().decode(VenueSearch.self, from: data)
                    completion(.success(search.response.venues))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    static func getImageURL(venueID: String, completion: @escaping (Result<[Photo], AppError>) -> ()) {
        
        let photoEndpoint = "https://api.foursquare.com/v2/venues/\(venueID)/photos?&client_id=\(APIKeys.ClientId)&client_secret=\(APIKeys.ClientSecret)&v=20210102"
        
        print(photoEndpoint)
        
        guard let url = URL(string: photoEndpoint) else {
            completion(.failure(.badURL(photoEndpoint)))
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let photoSearch = try JSONDecoder().decode(PhototSearch.self, from: data)
                    completion(.success(photoSearch.response.photos.items))
                }catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }

    }
    

}

