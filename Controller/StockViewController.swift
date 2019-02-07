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

    @IBOutlet  var columnButtons: [ColumnBtn]!
    
    
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
                    self.originalStockDataList = returnedFunction
                    self.stockDataList = self.originalStockDataList
                    
                    self.stockCollectionView.reloadData()
                    self.activityIndecator.stopAnimating()
                    self.activityIndecator.hidesWhenStopped = true
                } else {
                    print("error - nil data")
                }
            }
            }
    }
    
    
    @IBAction func sortSelectedColumn(_ selectedBtn: ColumnBtn) {
        columnButtons.forEach { $0.setImage(nil, for: .normal) }
        selectedBtn.sortType = selectedBtn.sortType.next
        stockDataList = StockSorting.selectedColumnSort(sortedType: selectedBtn.sortType, selectedColumn: columnType(for: selectedBtn.tag), stockDataList: self.originalStockDataList)
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
        let alert = UIAlertController(title: "Company name is", message: "\(stockData.companyTitle)" , preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    func columnType(for columnIndex: Int) -> ColumnType {
        switch columnIndex {
        case 0:
            return .symbol
        case 1:
            return .price
        case 2:
            return .priceChange
        case 3:
            return .volume
        default:
            return .symbol
        }
    }
}

