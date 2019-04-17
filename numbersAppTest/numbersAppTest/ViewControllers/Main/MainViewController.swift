//
//  MainViewController.swift
//  numbersAppTest
//
//  Created by AppStarter on 13/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: class {
    func numberSelected(_ number: Int)
}

class MainViewController: UIViewController {
    let numbers = [1, 2, 3, 4, 5]
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "MainCell")
        }
    }
    
    weak var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.enablePortainPadFullscreenMode(to: UIApplication.shared.statusBarOrientation, for: UIDevice.current.userInterfaceIdiom)
        selectFirstRow()
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        splitViewController?.enablePortainPadFullscreenMode(to: toInterfaceOrientation, for: UIDevice.current.userInterfaceIdiom)
    }
    
    func selectFirstRow() {
        guard numbers.count != 0 else { return }
        let firstObjectIndexPath = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: firstObjectIndexPath, animated: false, scrollPosition: .top)
        delegate?.numberSelected(numbers[firstObjectIndexPath.row])
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as? MainCell else { return UITableViewCell() }
        cell.decorateCell("\(numbers[indexPath.row])")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.numberSelected(numbers[indexPath.row])
    }
}
