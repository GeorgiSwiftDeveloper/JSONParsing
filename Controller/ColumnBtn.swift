//
//  ColumnBtn.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/30/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit
@IBDesignable
class ColumnBtn: UIButton {

        var sortType: SortType = .none {
            didSet {
                
            }
    }
    
    
       var columnType: ColumnType = .price
}
