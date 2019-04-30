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
            textLabel?.text = detailObject?.text
        }
    }
    
    @IBOutlet private weak var numberImageView: UIImageView? {
        didSet {
            numberImageView?.sd_setShowActivityIndicatorView(true)
            numberImageView?.sd_setIndicatorStyle(.gray)
            numberImageView?.sd_setImage(with: detailObject?.imageURL, placeholderImage: ViewContraint.placeholderImage)
        }
    }
    
    private var detailObject: DetailObject? {
        didSet {
            textLabel?.text = detailObject?.text
            numberImageView?.image = nil
            numberImageView?.sd_setImage(with: detailObject?.imageURL, placeholderImage: ViewContraint.placeholderImage)
        }
    }
    
    var number: String? {
        didSet {
            getData()
        }
    }
    
    private struct ViewContraint {
        static let placeholderImage = UIImage(named: "Placeholder")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        splitViewController?.enablePortainPadFullscreenMode(to: toInterfaceOrientation, for: UIDevice.current.userInterfaceIdiom)
    }
    
    private func getData() {
        guard let number = number else { return }
        
        NetworkingCenter().getDetailsForNumber(number: number, completion: { [weak self] detailObjectData in
            guard let weakSelf = self, let detailObjectData = detailObjectData else { return }
            weakSelf.detailObject = detailObjectData
        }) { [weak self] networkingError in
            guard let weakSelf = self, let networkingError = networkingError else { return }
            weakSelf.showErrorAlert(networkingError: networkingError)
        }
    }
}
