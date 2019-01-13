//
//  FormatPriceModel.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/12/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation

class FormatPrice {
       static func changeformat(format: String) -> String{
            if format.count <= 3 {
                return format
            }
            let reverseText = String(format.reversed())
    
            var temp: String = ""
            var index: Int = 0
    
        for _  in 0...reverseText.count - 1 {
    
                    if  index % 3 == 0 &&  index != 0 {
    
                        temp += ","
                    }
    
                    let tempindex = reverseText.index(reverseText.startIndex, offsetBy: index)
                    temp += String(reverseText[tempindex])
                    print( temp)
                    index += 1
    
            }
                temp = String(temp.reversed())
    
            return  temp
        }
}
