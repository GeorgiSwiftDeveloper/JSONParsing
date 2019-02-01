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
    static  func selectedColumnSort(myButton: UIButton ,sortedType: ColumnBtn , checkBool: Bool, columnSelected: ColumnType,stockDataList: [StockData]) -> [StockData] {
        var getStockData =  stockDataList
        if checkBool == false {
            sortedType.sortType = .asc
        }
        switch sortedType.sortType {
        case .asc:
            sortedType.sortType = .asc
            myButton.setImage(sortedType.imageForColumn, for: .normal)
        case .desc:
            sortedType.sortType = .desc
            myButton.setImage(sortedType.imageForColumn, for: .normal)
        case .none:
            sortedType.sortType = .none
            myButton.setImage(nil, for: .normal)
            getStockData.sort( by: { $0.numberOfStock < $1.numberOfStock})
        }
        switch columnSelected {
        case .symbol:
            switch sortedType.sortType {
            case .asc:
                getStockData.sort( by: { $0.symbolTitle.count > $1.symbolTitle.count})
            case .desc:
                getStockData.sort( by: { $0.symbolTitle.count < $1.symbolTitle.count})
            default:
                break
            }
        case .price:
            switch sortedType.sortType {
            case .asc:
                getStockData.sort( by: { $0.stockPrice.count > $1.stockPrice.count})
            case .desc:
                getStockData.sort( by: { $0.stockPrice.count < $1.stockPrice.count})
            default:
                break
            }
        case .priceChange:
            switch sortedType.sortType {
            case .asc:
                getStockData.sort( by: { $0.stockPriceChange > $1.stockPriceChange})
            case .desc:
                getStockData.sort( by: { $0.stockPriceChange < $1.stockPriceChange})
            default:
                break
            }
        case .volume:
            switch sortedType.sortType {
            case .asc:
                getStockData.sort( by: { $0.stockVolume > $1.stockVolume})
            case .desc:
                getStockData.sort( by: { $0.stockVolume < $1.stockVolume})
            default:
                break
            }
        default:
            break
        }
        switch sortedType.sortType {
        case .asc:
            sortedType.sortType = .desc
        case .desc:
            sortedType.sortType = .none
        case .none:
            sortedType.sortType = .asc
        }
        return getStockData
    }
}
//        switch sortedType.sortType {
//        case .asc:
//            sortedType.sortType = .asc
//            myButton.setImage(sortedType.imageForColumn, for: .normal)
//            getStockData.sort( by: { $0.stockPrice.count > $1.stockPrice.count})
//            sortedType.sortType = .desc
//        case .desc:
//            sortedType.sortType = .desc
//            myButton.setImage(sortedType.imageForColumn, for: .normal)
//            getStockData.sort( by: { $0.symbolTitle.count < $1.symbolTitle.count})
//            sortedType.sortType = .none
//        default:
//            break
//        }

