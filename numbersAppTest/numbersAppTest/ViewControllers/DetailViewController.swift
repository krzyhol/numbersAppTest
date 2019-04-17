//
//  DetailViewController.swift
//  numbersAppTest
//
//  Created by AppStarter on 13/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var textLabel: UILabel? {
        didSet {
            textLabel?.text = "\(number ?? -1)"
        }
    }
    
    private var number: Int? {
        didSet {
            textLabel?.text = "\(number ?? -1)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        splitViewController?.enablePortainPadFullscreenMode(to: toInterfaceOrientation, for: UIDevice.current.userInterfaceIdiom)
    }
}

extension DetailViewController: MainViewControllerDelegate {
    func numberSelected(_ number: Int) {
        self.number = number
    }
}
