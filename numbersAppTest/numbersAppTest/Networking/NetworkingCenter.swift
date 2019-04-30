//
//  NetworkingCenter.swift
//  numbersAppTest
//
//  Created by AppStarter on 27/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import Foundation

class NetworkingCenter {
    static let configuration = URLSessionConfiguration.default
    let session = URLSession(configuration: configuration)
    
    func getMainObjectsList(completion: @escaping ([MainObject]?) -> Void, failure: @escaping (NetworkingError?) -> Void) {
        guard let url = URL(string: NetworkingRouter.getMainList.path) else {
            failure(NetworkingError.wrongURLString)
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                failure(NetworkingError.connectionIssue(withMessage: error.localizedDescription))
            }
            
            if let response = response,
                let statusCode = (response as? HTTPURLResponse)?.statusCode,
                statusCode != 200 {
                let message = HTTPURLResponse.localizedString(forStatusCode: statusCode)
                failure(NetworkingError.connectionIssue(withMessage: "statusCode: \(statusCode), message: \(message)"))
            }
            
            guard let data = data else { return }
            do {
                let mainObjectsData = try JSONDecoder().decode([MainObject].self, from: data)
                
                DispatchQueue.main.async {
                    completion(mainObjectsData)
                }
            } catch _ {
                failure(NetworkingError.parsingError)
            }
        }.resume()
    }
    
    func getDetailsForNumber(number: String, completion: @escaping (DetailObject?) -> Void, failure: @escaping (NetworkingError?) -> Void) {
        guard let url = URL(string: NetworkingRouter.getDetails(name: number).path) else {
            failure(NetworkingError.wrongURLString)
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                failure(NetworkingError.connectionIssue(withMessage: error.localizedDescription))
            }
            
            if let response = response,
                let statusCode = (response as? HTTPURLResponse)?.statusCode,
                statusCode != 200 {
                let message = HTTPURLResponse.localizedString(forStatusCode: statusCode)
                failure(NetworkingError.connectionIssue(withMessage: "statusCode: \(statusCode), message: \(message)"))
            }
            
            guard let data = data else { return }
            do {
                let detailObject = try JSONDecoder().decode(DetailObject.self, from: data)
                
                DispatchQueue.main.async {
                    completion(detailObject)
                }
            } catch _ {
                failure(NetworkingError.parsingError)
            }
        }.resume()
    }
}
