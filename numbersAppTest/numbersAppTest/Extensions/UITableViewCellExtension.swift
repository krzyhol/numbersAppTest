//
//  UITableViewCellExtension.swift
//  numbersAppTest
//
//  Created by AppStarter on 17/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func setSelectedBackgroundColor(_ backgroundColor: UIColor) {
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = backgroundColor
        selectedBackgroundView = backgroundColorView
    }
}
