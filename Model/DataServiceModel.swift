//
//  DataServiceModel.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/12/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation
import UIKit

struct StockData {
    var numberOfStock: String
    var companyTitle: String
    var symbolTitle: String?
    var stockPrice: String
    var stockPriceChange:  String
    var stockVolume: Int
}
extension StockData {
    init?(myJosn: [String: Any]) {
        let  number = String()
        let  symbol = myJosn["Symbol"] as? String ?? ""
        let  companyName = myJosn["CompanyName"] as? String ?? ""
        let  price = myJosn["Price"] as? String ?? ""
        let  priceChange = myJosn["PricePercentChange"] as? String ?? ""
        let  volume = myJosn["Volume"] as? String ?? ""
        
        self.numberOfStock = number
        self.symbolTitle = symbol
        self.companyTitle = companyName
        self.stockPrice = price
        self.stockPriceChange = priceChange
        self.stockVolume = Int(volume)!
    }
}






