//
//  DetailViewController.swift
//  numbersAppTest
//
//  Created by AppStarter on 13/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    let mockDetailObjects: [Int: DetailObject] = [
        1 : DetailObject(name: 1, text: "Ichi", image: URL(string: "http://inu.tapptic.com/test/image.php?text=%E4%B8%80&size=60")!),
        2 : DetailObject(name: 2, text: "Ni", image: URL(string: "http://inu.tapptic.com/test/image.php?text=%E4%BA%8C&size=60")!),
        3 : DetailObject(name: 3, text: "San", image: URL(string: "http://inu.tapptic.com/test/image.php?text=%E4%B8%89&size=60")!),
        4 : DetailObject(name: 4, text: "Shi/ Yon", image: URL(string: "http://inu.tapptic.com/test/image.php?text=%E5%9B%9B&size=60")!)
    ]
    
    @IBOutlet private weak var textLabel: UILabel? {
        didSet {
            textLabel?.text = detailObject?.text
        }
    }
    
    private var detailObject: DetailObject? {
        didSet {
            textLabel?.text = detailObject?.text
        }
    }
    
    var mainObject: MainObject? {
        didSet {
            detailObject = mockDetailObjects[mainObject?.name ?? 0]
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
