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
    var sortType: SortType = .asc {
        didSet {
            switch sortType{
            case .asc:
                imageForColumn = arrowUpImage!
            case .desc:
                imageForColumn = arrowDownImage!
            case .none:
                break
            }
        }
    }
    var columnType: ColumnType = .symbol {
        didSet {
            
        }
    }
}




