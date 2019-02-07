//
//  ColumnBtn.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/30/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit

class ColumnBtn: UIButton {
    var imageForColumn = UIImage()
    var arrowUpImage = UIImage(named: "up-arrow")
    var arrowDownImage = UIImage(named: "down-arrow")
    var sortType: SortType = .none {
        didSet {
            switch sortType {
            case .asc:
                self.setImage(arrowUpImage, for: .normal)
            case .desc:
                self.setImage(arrowDownImage, for: .normal)
            case .none:
                self.setImage(nil, for: .normal)
                break
            }
        }
    }
}




