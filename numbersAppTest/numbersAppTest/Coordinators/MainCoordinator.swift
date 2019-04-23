//
//  MainCoordinator.swift
//  numbersAppTest
//
//  Created by AppStarter on 23/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

class MainCoordinator {
    private var splitViewController: UISplitViewController?
    private var mainViewController: MainViewController?
    private var detailViewController: DetailViewController?
    
    init(_ splitViewController: UISplitViewController) {
        self.splitViewController = splitViewController
    }
    
    func prepareSplitViewController() {
        guard let splitViewController = splitViewController else { return }
        
        splitViewController.delegate = self
        
        let leftNavigationController = splitViewController.viewControllers.first as? UINavigationController
        mainViewController = leftNavigationController?.topViewController as? MainViewController
        let navigationController = splitViewController.viewControllers.last as? UINavigationController
        if let secondViewController = navigationController?.topViewController as? DetailViewController {
            detailViewController = secondViewController
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        }
        
        mainViewController?.delegate = self
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func refreshAfterRotation(_ number: Int) {
        setNavigationFlowWithData(number)
    }
    
    func mainViewControllerCellTapped(_ number: Int) {
        setNavigationFlowWithData(number)
    }
    
    private func setNavigationFlowWithData(_ number: Int) {
        guard let detailViewController = detailViewController else { return }
        detailViewController.number = number
        
        if UIDevice.current.userInterfaceIdiom == .pad,
            (UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown) {
            splitViewController?.setPreferredDisplayMode(.primaryHidden, animated: true)
            let navigationController = splitViewController?.viewControllers.last as? UINavigationController
            navigationController?.viewControllers = [detailViewController]
        } else if splitViewController?.isCollapsed ?? false {
            mainViewController?.show(detailViewController, sender: nil)
        } else {
            let navigationController = splitViewController?.viewControllers.last as? UINavigationController
            navigationController?.viewControllers = [detailViewController]
        }
    }
}

extension MainCoordinator: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}