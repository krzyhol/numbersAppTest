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

    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        guard let splitViewController = self.window?.rootViewController as? UISplitViewController else { return true }

        coordinator = MainCoordinator(splitViewController)
        coordinator?.prepareSplitViewController()
        
        return true
    }
}
