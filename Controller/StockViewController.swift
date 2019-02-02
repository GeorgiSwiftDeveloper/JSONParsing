//
//  ViewController.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/8/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit
class  StockViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, StockCollectionViewCellDelegate{
    
    var stockDataList = [StockData]()
    var originalStockDataList = [StockData]()
    
    @IBOutlet weak var stockCollectionView: UICollectionView!
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!

    @IBOutlet weak var symbolBtn: ColumnBtn!
    @IBOutlet weak var priceBtn: ColumnBtn!
    @IBOutlet weak var changeBtn: ColumnBtn!
    @IBOutlet weak var volumeBtn: ColumnBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.activityIndector()
            self.stockValueLoadFunc()
    }
    
    func activityIndector() {
        activityIndecator.color = UIColor.black
        activityIndecator.startAnimating()
        stockCollectionView.backgroundView = activityIndecator
    }
    
    //MARK: - load JSON Function 
    func stockValueLoadFunc() {
        CallFunction.instance.loadStockInformationList() { (returnedFunction, error) in
                if error != nil  {
                    print(error?.localizedDescription as Any)
                    return
                }
            DispatchQueue.main.async {
                if let returnedFunction = returnedFunction {
                    //Treading
                    self.stockDataList = returnedFunction
                    
                    self.stockCollectionView.reloadData()
                    self.activityIndecator.stopAnimating()
                    self.activityIndecator.hidesWhenStopped = true
                } else {
                    print("error - nil data")
                }
            }
            }
    }
    static var selectedColumnType = ColumnType.def
    
    @IBAction func sortSelectedColumn(_ selectedBtn: ColumnBtn) {
        priceBtn.setImage(nil, for: .normal)
        changeBtn.setImage(nil, for: .normal)
        volumeBtn.setImage(nil, for: .normal)
        symbolBtn.setImage(nil, for: .normal)
        var boolCheck: Bool = true
        switch selectedBtn.tag {
        case 0:
            selectedBtn.columnType = .symbol
        case 1:
            selectedBtn.columnType = .price
        case 2:
            selectedBtn.columnType = .priceChange
        case 3:
            selectedBtn.columnType  = .volume
        default:
            break
        }
        if StockViewController.selectedColumnType != selectedBtn.columnType && StockViewController.selectedColumnType != ColumnType.def {
            boolCheck = false
        }
        StockViewController.selectedColumnType = selectedBtn.columnType
        stockDataList =  StockSorting.selectedColumnSort(myButton: selectedBtn ,sortedType: selectedBtn, columnCheck: boolCheck, selectedColumn: selectedBtn.columnType, stockDataList: self.stockDataList)
        self.stockCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   stockDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? StockCollectionViewCell
        let stockData =   stockDataList[indexPath.item]
        cell?.configureCell(stockData: stockData, delegate: self)
        return cell!
    }

    func symbolBtnTapped(stockData: StockData) {
        let alert = UIAlertController(title: "Here is Company name", message: "\(stockData.companyTitle)" , preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

