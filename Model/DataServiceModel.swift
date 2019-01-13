//
//  DataServiceModel.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/12/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation
import UIKit

struct returnStockValues {
    var symbol: String
    var companyName: String
    var price: String
    var pricechange:  String
    var volume: String
    
 
}

extension returnStockValues {
    
    init?(myJosn: [String: Any]) {
        let symbol = myJosn["Symbol"] as? String ?? ""
        let  companyName = myJosn["CompanyName"] as? String ?? ""
        let  price = myJosn["Price"] as? String ?? ""
        let  pricechange = myJosn["PricePercentChange"] as? String ?? ""
        let  volume = myJosn["Volume"] as? String ?? ""
        
        self.symbol = symbol
        self.companyName = companyName
        self.price = price
        self.pricechange = pricechange
        self.volume = volume
    }
}
     





