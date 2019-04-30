//
//  MainCell.swift
//  numbersAppTest
//
//  Created by AppStarter on 17/04/2019.
//  Copyright © 2019 Appstarter. All rights reserved.
//

import UIKit
import SDWebImage

final class MainCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var numberImageView: UIImageView!
    
    private struct CellContraint {
        static let normalBackgroundColor: UIColor = .white
        static let highlightedBackgroundColor: UIColor = .blue
        static let selectedBackgroundColor: UIColor = .red
        static let normalTextColor: UIColor = .black
        static let highlightedAndSelectedTextColor: UIColor = .white
        static let placeholderImage = UIImage(named: "Placeholder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellState(selected: isSelected)
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        setCellState(selected: selected)
        super.setSelected(selected, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        setCellState(highlighted: highlighted, selected: isSelected)
        super.setHighlighted(highlighted, animated: animated)
    }
    
    func decorateCell(_ data: MainObject) {
        titleLabel.text = data.number
        numberImageView.sd_setImage(with: data.imageURL, placeholderImage: CellContraint.placeholderImage, completed: nil)
    }
    
    private func setupView() {
        titleLabel.text = ""
        numberImageView.sd_setShowActivityIndicatorView(true)
        numberImageView.sd_setIndicatorStyle(.gray)
    }
    
    private func setCellState(highlighted: Bool = false, selected: Bool = false) {
        switch (highlighted, selected) {
        case (true, _):
            setSelectedBackgroundColor(CellContraint.highlightedBackgroundColor)
            titleLabel.textColor = CellContraint.highlightedAndSelectedTextColor
        case (false, true):
            setSelectedBackgroundColor(CellContraint.selectedBackgroundColor)
            titleLabel.textColor = CellContraint.highlightedAndSelectedTextColor
        default:
            backgroundColor = CellContraint.normalBackgroundColor
            titleLabel.textColor = CellContraint.normalTextColor
        }
    }
}
