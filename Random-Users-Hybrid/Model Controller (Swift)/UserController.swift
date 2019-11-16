//
//  UserController.swift
//  Random-Users-Hybrid
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation
import UIKit

//https://randomuser.me/api/?format=json&inc=name,email,phone,picture&results=1000

@objc (DWPUserController)
class UserController: NSObject {
    
    var baseUrl = URL(string: "https://randomuser.me/api/")!
    
    @objc(sharedController)
    static let shared = UserController()
    
    @objc(getUsers:completionHandler:)
    func getUsers(for numberOfResults: Int, completion: @escaping ([User]?, Error?) -> Void) {
        var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        let formatQueryItem = URLQueryItem(name: "format", value: "json")
        let incQueryItem = URLQueryItem(name: "inc", value: "name,email,phone,picture")
        let resultQueryItem = URLQueryItem(name: "results", value: String(numberOfResults))
        
        urlComponents?.queryItems = [formatQueryItem, incQueryItem, resultQueryItem]
        
        guard let urlRequest = urlComponents?.url else {return}
        
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("there is an error in getting the data: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("there is no data")
                completion(nil, error)
                return
            }
            
            do  {
                
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                    let error = NSError(domain: "UserControllerErrorDomain", code: 1, userInfo: nil);
                    throw error
                }
                 
                guard let usersDictionaries = dictionary["results"] as? [[String : Any]] else {
                    let error = NSError(domain: "UserControllerErrorDomain", code: 2, userInfo: nil);
                    throw error
                }
                
                let users = usersDictionaries.compactMap {User(dictionary: $0)}
                print(users)
                print(users[0].firstName)
                print(users[0].email)
                print(users[0].phoneNumber)
                print(users[0].imageURLString)
                completion(users, nil)
                
            } catch {
                NSLog("there is an error in encoding data \(error)")
                completion(nil, error)
            }
            }.resume()
    }
    
    @objc(fetchImagesWithimageURLString:completionHandler:)
    func fetchImages(for urlString: String, completion: @escaping (UIImage?, Error?) -> Void) {
        
        let urlrequest = URL(string: urlString)!
        
        var request = URLRequest(url: urlrequest)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            let image = UIImage(data: data)
            
            completion(image, nil)
        }.resume()
    }
    
    //add fillinUser method here that will fetch ther rest of properties besides first name since first name is what you need for maintableview controller
    
    //make property initializer to have all nil besides first name
    
    func fillInUser(for user: User) {
        
    }
    
    
}
