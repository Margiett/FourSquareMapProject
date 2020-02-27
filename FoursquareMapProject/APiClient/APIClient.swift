//
//  APIClient.swift
//  FoursquareMapProject
//
//  Created by Tanya Burke on 2/24/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
import NetworkHelper



struct SearchAPICLient{
    static func getSearchResults(completion: @escaping (Result <Response,AppError>) -> ()){
        
        let endPointURL = "https://api.foursquare.com/v2/venues/search?ll=\(SearchQuery.lat ?? 40.7),\(SearchQuery.long ?? -74)&client_id=\(APIKeys.CientId)&client_secret=\(APIKeys.ClientSecret)&v=\(Date().currectDate())&query=\(SearchQuery.wordSearch)"
        
        guard let url = URL(string: endPointURL) else {
            completion(.failure(.badURL(endPointURL)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
                
            case .success(let data):
                do{
                    let searchResults = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(searchResults))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    
    static func venueUrl(venue: Venue, completion: @escaping (Result<[Item], AppError>) -> () ) {
        
        let venueEndpoint = "https://api.foursquare.com/v2/venues/\(venue.id)/photos?&client_id=\(APIKeys.CientId)&client_secret=\(APIKeys.ClientSecret)&v=\(Date().currectDate())"
        
        guard let url = URL(string: venueEndpoint) else {
            completion(.failure(.badURL(venueEndpoint)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
                
            case .success(let data):
                do{
                    let venueResults = try JSONDecoder().decode([Item].self, from: data)
                    completion(.success(venueResults))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    static func getImageURL(locationID: String, completion: @escaping (Result<[PhotoModel], AppError>) -> ()) {
        var photoEndpoint = ""
        photoEndpoint = photoEndpoint.replacingOccurrences(of: "", with: "%20")
        guard let url = URL(string: photoEndpoint) else {
            completion(.failure(.badURL(photoEndpoint)))
            return
        }
        
//        let imageUrl = "\(photo.itemPrefix)300*300\(photo.suffix)"
//        return imageUrl
    }
    

}


