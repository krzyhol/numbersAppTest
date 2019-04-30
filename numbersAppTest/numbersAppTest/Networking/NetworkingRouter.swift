//
//  NetworkingRouter.swift
//  numbersAppTest
//
//  Created by AppStarter on 27/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import Foundation

enum NetworkingRouter {
    static let mainURLString = "http://dev.tapptic.com/test/json.php"
    
    case getMainList
    case getDetails(name: String)
    
    var path: String {
        switch self {
        case .getMainList:
            return NetworkingRouter.mainURLString
        case let .getDetails(name: name):
            return NetworkingRouter.mainURLString + "?name=\(name)"
        }
    }
}
