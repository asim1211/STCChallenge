//
//  APIService.swift
//  STCChallenge
//
//  Created by assem hakami on 06/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    
    //API URL
    let URL = "https://api.github.com/search/users"
    
    
    static let shared = APIService()
    
    
    // This method get text from the user and return array of object People
    func fetchPeople(searchText: String, completionHandler: @escaping ([People]) -> ()) {
        let parameters = ["q": searchText]
        Alamofire.request(URL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
        
            if let err = dataResponse.error {
                print("Failed to contact Github", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
            
                
                completionHandler(searchResult.items)
            } catch let decodeErr {
                print("Failed to decode:", decodeErr)
            }
        }
    }
    
    
    
    
     // This method return all the users from the AOI URL ( return array of object People)
    func fetchAllPeople(searchText: String, completionHandler: @escaping ([People]) -> ()) {
       
        Alamofire.request(URL, method: .get, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            
            if let err = dataResponse.error {
                print("Failed to contact Github", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                
                
                completionHandler(searchResult.items)
            } catch let decodeErr {
                print("Failed to decode:", decodeErr)
            }
        }
    }
    
    
    //This mmethod get all repository of a user (return array of object Repository)
    func fetchRepo(searchText: String, completionHandler: @escaping ([Repository]) -> ()) {
        
        Alamofire.request(searchText, method: .get, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            
            if let err = dataResponse.error {
                print("Failed to contact Github", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            do {
                let result = try JSONDecoder().decode([Repository].self, from: data)
                
                completionHandler(result)
                
            } catch let decodeErr {
                print("Failed to decode:", decodeErr)
            }
        }
    }
    
    
    //This mmethod get all user the users that are forked to a single repository (return array of object ForkResult)
    func fetchFork(searchText: String, completionHandler: @escaping ([ForkResult]) -> ()) {
        
        Alamofire.request(searchText, method: .get, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            
            if let err = dataResponse.error {
                print("Failed to contact Github", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            do {
                let forkResult = try JSONDecoder().decode([ForkResult].self, from: data)
                
                
                completionHandler(forkResult)
            } catch let decodeErr {
                print("Failed to decode:", decodeErr)
            }
        }
    }
    
    
    // This method get all information of a user (return object People)
    func fetchPeopleProfile(searchText: String, completionHandler: @escaping (People) -> ()) {
     
        
        Alamofire.request(searchText, method: .get, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            
            if let err = dataResponse.error {
                print("Failed to contact Github", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            do {
                 
                let searchResult = try JSONDecoder().decode(People.self, from: data)
              
                completionHandler(searchResult)
            } catch let decodeErr {
                print("Failed to decode:", decodeErr)
            }
        }
    }

    
    
    // struct to parse fetchPeople (search user)
    struct SearchResults: Codable {
        let total_count: Int
        let incomplete_results: Bool
        let items: [People]
        
    }
    
    
}
