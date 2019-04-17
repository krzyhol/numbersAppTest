//
//  AppDelegate.swift
//  numbersAppTest
//
//  Created by AppStarter on 13/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var splitDelegate = SplitDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let splitViewController = self.window?.rootViewController as? UISplitViewController {
            splitViewController.delegate = splitDelegate

            let leftNavigationController = splitViewController.viewControllers.first as? UINavigationController
            let mainViewController = leftNavigationController?.topViewController as? MainViewController
            let navigationController = splitViewController.viewControllers.last as? UINavigationController
            let detailViewController = navigationController?.topViewController as? DetailViewController

            mainViewController?.delegate = detailViewController
        }
        
        return true
    }
}
