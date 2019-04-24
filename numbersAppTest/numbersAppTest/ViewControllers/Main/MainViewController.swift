//
//  MainViewController.swift
//  numbersAppTest
//
//  Created by AppStarter on 13/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: class {
    func mainViewControllerCellTapped(_ number: Int)
    func refreshAfterRotation(_ number: Int)
}

final class MainViewController: UIViewController {
    private let mainObjects: [MainObject] = [
        MainObject(name: 1, image: URL(string: "http://inu.tapptic.com/test/image.php?text=%E4%B8%80")!),
        MainObject(name: 2, image: URL(string: "http://inu.tapptic.com/test/image.php?text=%E4%BA%8C")!),
        MainObject(name: 3, image: URL(string: "http://inu.tapptic.com/test/image.php?text=%E4%B8%89")!),
        MainObject(name: 4, image: URL(string: "http://inu.tapptic.com/test/image.php?text=%E5%9B%9B")!)
    ]
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerCells([MainCell.self])
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
        let selectedIndexPath = tableView.indexPathForSelectedRow
        guard mainObjects.count != 0 else { return }
        delegate?.refreshAfterRotation(mainObjects[selectedIndexPath?.row ?? 0].name)
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        splitViewController?.preferredDisplayMode = .primaryOverlay
    }
    
    private func selectFirstRow() {
        guard mainObjects.count != 0 else { return }
        
        let firstObjectIndexPath = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: firstObjectIndexPath, animated: false, scrollPosition: .top)
        delegate?.mainViewControllerCellTapped(mainObjects[firstObjectIndexPath.row].name)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainCell.self), for: indexPath) as? MainCell else { return UITableViewCell() }
        let selectedObject = mainObjects[indexPath.row]
        cell.decorateCell(selectedObject)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        delegate?.mainViewControllerCellTapped(mainObjects[indexPath.row].name)
    }
}
