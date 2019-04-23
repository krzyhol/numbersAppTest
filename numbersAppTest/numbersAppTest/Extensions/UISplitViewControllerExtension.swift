//
//  UISplitViewControllerExtension.swift
//  numbersAppTest
//
//  Created by AppStarter on 15/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

extension UISplitViewController {
    // Use it on your split view controller during rotation
    // and when you load view
    func enablePortainPadFullscreenMode(to interfaceOrientation: UIInterfaceOrientation, for devieceType: UIUserInterfaceIdiom) {
        if (interfaceOrientation == .portrait || interfaceOrientation == .portraitUpsideDown), devieceType == .pad {
            self.minimumPrimaryColumnWidth = self.view.bounds.size.width
            self.maximumPrimaryColumnWidth = self.view.bounds.size.width
            self.preferredDisplayMode = .primaryOverlay
        } else {
            self.minimumPrimaryColumnWidth = UISplitViewController.automaticDimension
            self.maximumPrimaryColumnWidth = UISplitViewController.automaticDimension
            self.preferredDisplayMode = .automatic
        }
    }
    
    // Change preferredDisplayMode with animation
    func setPreferredDisplayMode(_ preferredDisplayMode: DisplayMode, animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.preferredDisplayMode = preferredDisplayMode
            }
        } else {
            self.preferredDisplayMode = preferredDisplayMode
        }
    }
}
