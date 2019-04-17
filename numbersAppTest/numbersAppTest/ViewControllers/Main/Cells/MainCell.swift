//
//  MainCell.swift
//  numbersAppTest
//
//  Created by AppStarter on 17/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    private struct CellContraint {
        static let normalBackgroundColor: UIColor = .white
        static let highlightedBackgroundColor: UIColor = .blue
        static let selectedBackgroundColor: UIColor = .red
        static let normalTextColor: UIColor = .black
        static let highlightedAndSelectedTextColor: UIColor = .white
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellState(selected: isSelected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        setCellState(selected: selected)
        super.setSelected(selected, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        setCellState(highlighted: highlighted, selected: isSelected)
        super.setHighlighted(highlighted, animated: animated)
    }
    
    func decorateCell(_ data: String) {
        titleLabel.text = data
    }
    
    private func setCellState(highlighted: Bool = false, selected: Bool = false) {
        switch (highlighted, selected) {
        case (true, _):
            let backgroundColorView = UIView()
            backgroundColorView.backgroundColor = CellContraint.highlightedBackgroundColor
            selectedBackgroundView = backgroundColorView
            titleLabel.textColor = CellContraint.highlightedAndSelectedTextColor
        case (false, true):
            let backgroundColorView = UIView()
            backgroundColorView.backgroundColor = CellContraint.selectedBackgroundColor
            selectedBackgroundView = backgroundColorView
            titleLabel.textColor = CellContraint.highlightedAndSelectedTextColor
        default:
            backgroundColor = CellContraint.normalBackgroundColor
            titleLabel.textColor = CellContraint.normalTextColor
        }
    }
    
}
