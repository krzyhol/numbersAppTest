//
//  SplitDelegate.swift
//  numbersAppTest
//
//  Created by AppStarter on 13/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

final class SplitDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {        
        return true
    }
}
