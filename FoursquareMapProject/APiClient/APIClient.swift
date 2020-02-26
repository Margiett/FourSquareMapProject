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


static func getImages(){

}

}
