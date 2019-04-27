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
    
    func getMainObjectsList(completion: @escaping ([MainObject]?) -> Void) {
        guard let url = URL(string: NetworkingRouter.getMainList.path) else {
            // ToDo: Error handler
            completion(nil)
            return
        }
        
        session.dataTask(with: url) { [unowned self] (data, response, error) in
            guard self.verifyRespose(data: data, response: response, error: error) else {
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            do {
                let mainObjectsData = try JSONDecoder().decode([MainObject].self, from: data)
                
                DispatchQueue.main.async {
                    completion(mainObjectsData)
                }
            } catch let jsonError {
                // ToDo: Error handler
                print(jsonError)
                completion(nil)
            }
        }.resume()
    }
    
    private func verifyRespose(data: Data?, response: URLResponse?, error: Error?) -> Bool {
        if let error = error {
            // ToDo: Error handler
            print(error.localizedDescription)
            return false
        }
        
        if let response = response,
            let statusCode = (response as? HTTPURLResponse)?.statusCode,
            statusCode != 200 {
            // ToDo: Error handler
            let message = HTTPURLResponse.localizedString(forStatusCode: statusCode)
            print("statusCode: \(statusCode), message: \(message)")
            return false
        }
        
        return true
    }
}
