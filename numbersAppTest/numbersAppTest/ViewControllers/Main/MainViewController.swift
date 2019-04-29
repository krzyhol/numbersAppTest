//
//  MainViewController.swift
//  numbersAppTest
//
//  Created by AppStarter on 13/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: class {
    func mainViewControllerCellTapped(_ mainObject: MainObject)
    func refreshAfterRotation(_ mainObject: MainObject)
}

final class MainViewController: UIViewController {
    private var mainObjects: [MainObject]? {
        didSet {
            tableView.reloadData()
        }
    }
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
 
        getData()
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        splitViewController?.enablePortainPadFullscreenMode(to: toInterfaceOrientation, for: UIDevice.current.userInterfaceIdiom)
        let selectedIndexPath = tableView.indexPathForSelectedRow
        guard let mainObjects = mainObjects, mainObjects.count != 0 else { return }
        delegate?.refreshAfterRotation(mainObjects[selectedIndexPath?.row ?? 0])
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        splitViewController?.preferredDisplayMode = .primaryOverlay
    }
    
    private func selectFirstRow() {
        guard let mainObjects = mainObjects, mainObjects.count != 0 else { return }

        let firstObjectIndexPath = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: firstObjectIndexPath, animated: false, scrollPosition: .top)
        delegate?.mainViewControllerCellTapped(mainObjects[firstObjectIndexPath.row])
    }
    
    private func getData() {
        NetworkingCenter().getMainObjectsList(completion: { [weak self] mainObjectsData in
            guard let weakSelf = self, let mainObjectsData = mainObjectsData else { return }
            weakSelf.mainObjects = mainObjectsData
        }) { [weak self] networkingError in
            guard let weakSelf = self, let networkingError = networkingError else { return }
            weakSelf.showErrorAlert(networkingError: networkingError)
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainCell.self), for: indexPath) as? MainCell,
            let mainObjects = mainObjects,
            mainObjects.count != 0 else { return UITableViewCell() }
        let selectedObject = mainObjects[indexPath.row]
        cell.decorateCell(selectedObject)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mainObjects = mainObjects,
            mainObjects.count != 0 else { return }
        delegate?.mainViewControllerCellTapped(mainObjects[indexPath.row])
    }
}
