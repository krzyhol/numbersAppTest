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
        let alert = UIAlertController(title: networkingError.titleAlert, message: networkingError.messageAlert, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
