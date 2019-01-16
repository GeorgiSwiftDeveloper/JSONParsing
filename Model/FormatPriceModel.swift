//
//  FormatPriceModel.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/12/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation
class FormatPrice {
    static func addCommaFormatter(comingNumber: Int) -> String {
        let numberOfFormatter = NumberFormatter()
        numberOfFormatter.numberStyle = .decimal
        numberOfFormatter.maximumFractionDigits = 0
        return numberOfFormatter.string(from: NSNumber(value: comingNumber))!
    }
}




