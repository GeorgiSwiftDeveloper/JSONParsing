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
        numberLbl.text = stockData.numberOfStock
        symbolLbl.text = stockData.symbolTitle
        priceLbl.text  = stockData.stockPrice
        pricePercentLbl.text = "\(stockData.stockPriceChange) %"
        valueLbl.text = FormatPrice.addCommaFormatter(comingNumber: stockData.stockVolume)
        let tap = UITapGestureRecognizer(target: self, action: #selector(btnTapped(_:)))
        symbolLbl.isUserInteractionEnabled = true
        symbolLbl.addGestureRecognizer(tap)
    }
    @objc func btnTapped(_ sender: UITapGestureRecognizer) {
         delegate?.symbolBtnTapped(stockData: stockdata)
    }
    
}


