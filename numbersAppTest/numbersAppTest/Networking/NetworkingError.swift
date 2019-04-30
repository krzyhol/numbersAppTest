//
//  NetworkingError.swift
//  numbersAppTest
//
//  Created by AppStarter on 27/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case wrongURLString
    case connectionIssue(withMessage: String)
    case parsingError
    
    var titleAlert: String {
        switch self {
        case .wrongURLString:
            return "Your URL is wrong"
        case .parsingError:
            return "Parsing is not completed"
        case .connectionIssue(_):
            return "Connection issue"
        }
    }
    
    var messageAlert: String {
        switch self {
        case .wrongURLString, .parsingError:
            return "Contact with your administrator"
        case let .connectionIssue(errorMessage):
            return errorMessage
        }
    }
}
