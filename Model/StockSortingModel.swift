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
    static let sortStockData = StockSorting()
    
    var arrowUpImage = UIImage(named: "up-arrow")
    var arrowDownImage = UIImage(named: "down-arrow")
    
    
    var buttonActive = true
    
    func selectedColumnSort(myButton: UIButton ,getStockDataList: @escaping (_ returnStockValue: [StockData]? , _ error: Error?) -> ()) {
     var getStockData =  StockViewController.stockDataList
        if myButton.tag == 1 {
            if buttonActive {
                myButton.setImage(arrowUpImage, for: .normal)
                getStockData.sort( by: { $0.symbolTitle! > $1.symbolTitle!})
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
        getStockDataList(getStockData,nil)
    }
    
}
