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
    static  func selectedColumnSort(sortedType: SortType, selectedColumn: ColumnType, stockDataList: [StockData]) -> [StockData] {
        
        var getStockData =  stockDataList
        
        switch selectedColumn {
        case .symbol:
            switch sortedType {
            case .asc:
                getStockData.sort( by: { $0.symbol < $1.symbol})
            case .desc:
                getStockData.sort( by: { $0.symbol > $1.symbol})
            default:
                break
            }
        case .price:
            switch sortedType {
            case .asc:
                getStockData.sort( by: { $0.price < $1.price})
            case .desc:
                getStockData.sort( by: { $0.price > $1.price})
            default:
                break
            }
        case .priceChange:
            switch sortedType {
            case .asc:
                getStockData.sort( by: { $0.priceChange < $1.priceChange})
            case .desc:
                getStockData.sort( by: { $0.priceChange > $1.priceChange})
            default:
                break
            }
        case .volume:
            switch sortedType {
            case .asc:
                getStockData.sort( by: { $0.volume < $1.volume})
            case .desc:
                getStockData.sort( by: { $0.volume > $1.volume})
            default:
                break
            }
        }
        return getStockData
    }
}
