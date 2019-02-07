//
//  DataServiceModel.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/12/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.


import Foundation
import UIKit

enum SortType{
    case none
    case asc
    case desc
    
    var next: SortType {
        switch self {
        case .asc: return .desc
        case .desc: return .none
        case .none: return .asc
        }
    }
}
enum ColumnType {
    case symbol
    case price
    case priceChange
    case volume
}

class StockData: NSObject {
    var index: Int
    var companyTitle: String
    var symbol: String
    var price: Double
    var priceChange:  Double
    var volume: Int
    
    init(myJosn: [String: Any], index: Int) {
        self.index = index
        self.symbol = myJosn["Symbol"] as? String ?? ""
        self.companyTitle = myJosn["CompanyName"] as? String ?? ""
        self.price = Double(myJosn["Price"] as? String ?? "") ?? 0.0
        self.priceChange = Double(myJosn["PricePercentChange"] as? String ?? "") ?? 0.0
        self.volume = Int(myJosn["Volume"] as? String ?? "") ?? 0
    }
}








