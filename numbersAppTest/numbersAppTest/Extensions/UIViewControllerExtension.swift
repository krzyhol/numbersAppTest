//
//  UIViewControllerExtension.swift
//  numbersAppTest
//
//  Created by AppStarter on 27/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(networkingError: NetworkingError, retry: @escaping () -> Void) {
        let alert = UIAlertController(title: networkingError.titleAlert, message: networkingError.messageAlert, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "OK", style: .cancel)
        let retryAction = UIAlertAction(title: "Retry", style: .default) { _ in
            retry()
        }
        
        alert.addAction(doneAction)
        alert.addAction(retryAction)
        
        present(alert, animated: true, completion: nil)
    }
}
