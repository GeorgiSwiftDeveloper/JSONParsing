//
//  CallJsonFunctionModel.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/22/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation
import UIKit

class CallFunction {
    static let instance = CallFunction()
    let urlPath = "https://myibd.investors.com/searchapi/quote/AAPL,FB,GOOGL,TWTR,YHOO,MSFT"
    
    func loadStockInformationList(loadFunctionComplete: @escaping (_ returnStockValue: [StockData]?, _ error: Error?) -> ()) {
        guard let url = URL(string: urlPath) else {return}
        var stockValueReturn = [StockData]()
        let getUrlInformation = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil  {
                print("Cant find url")
                loadFunctionComplete(nil, error)
            }else {
                do {
                    guard   let getStockJsonFormat = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]] else { return }
                    let compactMapStockValues = getStockJsonFormat.compactMap { dictionary in
                        return StockData(myJosn: dictionary)
                    }
                    var index: Int = 0
                    for stockValues in compactMapStockValues {
                        let propertyValue = StockData(numberOfStock: "\(index + 1)", companyTitle: stockValues.companyTitle, symbolTitle: stockValues.symbolTitle, stockPrice: stockValues.stockPrice, stockPriceChange: stockValues.stockPriceChange, stockVolume: stockValues.stockVolume)
                        stockValueReturn.append(propertyValue)
                        index += 1
                    }
                }catch{
                    print("Cant find stock values \(error.localizedDescription)")
                    loadFunctionComplete(nil, error)
                }
            }
            loadFunctionComplete(stockValueReturn,nil)
        }
        getUrlInformation.resume()
    }
}
