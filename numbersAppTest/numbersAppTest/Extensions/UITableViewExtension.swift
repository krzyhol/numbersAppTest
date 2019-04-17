//
//  UITableViewExtension.swift
//  numbersAppTest
//
//  Created by AppStarter on 17/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCells(_ cellsClasses: [AnyClass], bundle: Bundle? = nil) {
        cellsClasses.forEach { cellClasses in
            self.register(UINib(nibName: String(describing: cellClasses.self), bundle: bundle), forCellReuseIdentifier: String(describing: cellClasses.self))
        }
    }
}
