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
}
