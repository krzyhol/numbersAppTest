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
        if devieceType == .pad {
            self.preferredDisplayMode = .primaryOverlay
        } else {
            self.preferredDisplayMode = .automatic
        }
        
        if (interfaceOrientation == .portrait || interfaceOrientation == .portraitUpsideDown), devieceType == .pad {
            self.minimumPrimaryColumnWidth = self.view.bounds.size.width
            self.maximumPrimaryColumnWidth = self.view.bounds.size.width
        } else {
            self.minimumPrimaryColumnWidth = UISplitViewController.automaticDimension
            self.maximumPrimaryColumnWidth = UISplitViewController.automaticDimension
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
