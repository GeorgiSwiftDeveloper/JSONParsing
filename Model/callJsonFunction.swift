//
//  callJsonFunction.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/15/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation

class CallFunction {
    static let instance = CallFunction()
    
    func loadStockInformationList(url: URL,loadFunctionComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        let getUrlInformation = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil  {
                print("Cant find url")
            }else {
                do {
                    guard   let getStockJsonFormat = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]] else { return }
                    print(getStockJsonFormat)
                    let compactMapStockValues = getStockJsonFormat.compactMap { dictionary in
                        return ReturnStockValues(myJosn: dictionary)
                    }
                    var index: Int = 0
                    for stockValues in compactMapStockValues {
                        let propertyValue = ReturnStockValues(numberCount: "\(index + 1)", companyTitle: stockValues.companyTitle, symbolTitle: stockValues.symbolTitle, priceCount: stockValues.priceCount, pricechangeCount: stockValues.pricechangeCount, volumeCount: stockValues.volumeCount)
                        StockViewController.newProperty.append(propertyValue)
                        index += 1
                    }
                }catch{
                    print("Cant find stock values \(error.localizedDescription)")
                }
            }
            loadFunctionComplete(true,nil)
        }
        getUrlInformation.resume()
    }
}
