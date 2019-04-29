//
//  UIViewControllerExtension.swift
//  numbersAppTest
//
//  Created by AppStarter on 27/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(networkingError: NetworkingError) {
        var title = ""
        var message = ""
        
        switch networkingError {
        case .wrongURLString:
            title = "Your URL is wrong"
            message = "Contact with your administrator"
        case .parsingError:
            title = "Parsing is not completed"
            message = "Contact with your administrator"
        case let .connectionIssue(errorMessage):
            title = "Connection issue"
            message = errorMessage
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
