//
//  StockCollectionViewCell.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/19/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//
import Foundation
import UIKit

protocol StockCollectionViewCellDelegate: AnyObject {
    func symbolBtnTapped(stockData: StockData)
}

class StockCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var symbolLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var pricePercentLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    
    weak var delegate: StockCollectionViewCellDelegate?
    
    private var stockdata: StockData!
    
    func configureCell(stockData: StockData, delegate: StockCollectionViewCellDelegate) {
        self.delegate = delegate
        self.stockdata = stockData
        numberLbl.text = "\(stockData.index)"
        symbolLbl.text = stockData.symbol
        priceLbl.text  = "\(stockData.price)"
        pricePercentLbl.text = "\(stockData.priceChange) %"
        valueLbl.text = FormatPrice.addCommaFormatter(comingNumber: stockData.volume)
        let tap = UITapGestureRecognizer(target: self, action: #selector(SymbolLblTapped(_:)))
        symbolLbl.isUserInteractionEnabled = true
        symbolLbl.addGestureRecognizer(tap)
    }
    @objc func SymbolLblTapped(_ sender: UITapGestureRecognizer) {
         delegate?.symbolBtnTapped(stockData: stockdata)
    }
    
}


