//
//  DataServiceModel.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/12/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation
import UIKit

struct ReturnStockValues {
    var numberCount: String
    var companyTitle: String
    var symbolTitle: String
    var priceCount: String
    var pricechangeCount:  String
    var volumeCount: Int
}
extension ReturnStockValues {
    init?(myJosn: [String: Any]) {
        let  number = String()
        let  symbol = myJosn["Symbol"] as? String ?? ""
        let  companyName = myJosn["CompanyName"] as? String ?? ""
        let  price = myJosn["Price"] as? String ?? ""
        let  pricechange = myJosn["PricePercentChange"] as? String ?? ""
        let  volume = myJosn["Volume"] as? String ?? ""
        
        self.numberCount = number
        self.symbolTitle = symbol
        self.companyTitle = companyName
        self.priceCount = price
        self.pricechangeCount = pricechange
        self.volumeCount = Int(volume)!
    }
}






