//
//  StockSortingModel.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/23/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation
import UIKit

class StockSorting {
    
    private static var arrowUpImage = UIImage(named: "up-arrow")
    private static  var arrowDownImage = UIImage(named: "down-arrow")
    
    private static var buttonActive = true
    
    static  func selectedColumnSort(myButton: UIButton ,stockDataList: [StockData]) -> [StockData] {
     var getStockData =  stockDataList
        if myButton.tag == 1 {
            if buttonActive {
                myButton.setImage(arrowUpImage, for: .normal)
                getStockData.sort( by: { $0.symbolTitle > $1.symbolTitle})
            }else {
                myButton.setImage(arrowDownImage, for: .normal)
                  getStockData.sort( by: { $0.numberOfStock < $1.numberOfStock})
            }
            buttonActive = !buttonActive
        }
        if myButton.tag == 2 {
            if buttonActive {
                myButton.setImage(arrowUpImage, for: .normal)
                getStockData.sort( by: { $0.stockPrice.count > $1.stockPrice.count})
            }else {
                myButton.setImage(arrowDownImage, for: .normal)
                getStockData.sort( by: { $0.numberOfStock < $1.numberOfStock})
            }
            buttonActive = !buttonActive
        }
        if myButton.tag == 3 {
            if buttonActive {
                myButton.setImage(arrowUpImage, for: .normal)
                getStockData.sort( by: { $0.stockPriceChange < $1.stockPriceChange})
            }else {
                myButton.setImage(arrowDownImage, for: .normal)
                getStockData.sort( by: { $0.numberOfStock < $1.numberOfStock})
            }
            buttonActive = !buttonActive
        }
        if myButton.tag == 4 {
            if buttonActive {
                myButton.setImage(arrowUpImage, for: .normal)
                getStockData.sort( by: { $0.stockVolume < $1.stockVolume})
            }else {
                myButton.setImage(arrowDownImage, for: .normal)
                getStockData.sort( by: { $0.numberOfStock < $1.numberOfStock})
            }
            buttonActive = !buttonActive
        }
        return getStockData
    }
    
}
