//
//  ViewController.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/8/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit
class  StockViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, StockCollectionViewCellDelegate{
    
    static var stockDataList = [StockData]()
    
    @IBOutlet weak var stockCollectionView: UICollectionView!
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.stockValueLoadFunc()
            self.activityIndector()
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
            if let returnedFunction = returnedFunction {
                //Treading
                DispatchQueue.global(qos: .userInteractive).async {
                    StockViewController.stockDataList = returnedFunction
                }
                DispatchQueue.main.async {
                    self.stockCollectionView.reloadData()
                    self.activityIndecator.stopAnimating()
                    self.activityIndecator.hidesWhenStopped = true
                }
                
                
            } else {
                print("error - nil data")
            }
        }
    }
    
    @IBAction func sortSelectedColumn(_ selectedBtn: UIButton) {
        StockSorting.sortStockData.selectedColumnSort(myButton: selectedBtn) { (getStockData, error) in
            if error != nil  {
                print("Error cant sort stock data\(String(describing: error?.localizedDescription))")
            }else {
                DispatchQueue.global(qos: .userInteractive).async {
                    StockViewController.stockDataList = getStockData!
                    DispatchQueue.main.async {
                         self.stockCollectionView.reloadData()
                    }
                   
                }
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   StockViewController.stockDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? StockCollectionViewCell
        let stockData =   StockViewController.stockDataList[indexPath.item]
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

