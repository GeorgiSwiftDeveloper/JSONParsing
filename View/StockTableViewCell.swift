//
//  StockTableViewCell.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/12/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import Foundation
import UIKit
class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var symbolBtn: UIButton!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var pricePercentLbl: UILabel!
    @IBOutlet weak var volumeChangeLbl: UILabel!
    
    func configureCell(number: String, symbol: String, price: String, pricePercent: String, volume: Int) {
        numberLbl.text = number
        symbolBtn.setTitle(symbol, for: .normal) 
        priceLbl.text  = price
        pricePercentLbl.text = "\(pricePercent) %"
        volumeChangeLbl.text = FormatPrice.addCommaFormatter(comingNumber: volume)
    }
}



