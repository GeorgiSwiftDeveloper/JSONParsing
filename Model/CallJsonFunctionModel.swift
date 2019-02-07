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
        
        let getUrlInformation = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil || data == nil  {
                print("Cant find url")
                loadFunctionComplete(nil, error)
            } else {
                do {
                    guard let getStockJsonFormat = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]] else { return }
                    var stockValueReturn = [StockData]()
                    for index in 0..<getStockJsonFormat.count {
                        let stockData = StockData(myJosn: getStockJsonFormat[index], index: index)
                        stockValueReturn.append(stockData)
                    }
                    loadFunctionComplete(stockValueReturn,nil)
                } catch {
                    print("Cant find stock values \(error.localizedDescription)")
                    loadFunctionComplete(nil, error)
                }
            }
        }
        getUrlInformation.resume()
    }
}
