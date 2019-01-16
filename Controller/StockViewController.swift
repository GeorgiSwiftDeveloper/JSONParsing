//
//  ViewController.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/8/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit


class  StockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - URL
    let url = URL(string: "https://myibd.investors.com/searchapi/quote/AAPL,FB,GOOGL,TWTR,YHOO,MSFT")
    
    static var newProperty = [ReturnStockValues]()
    
    @IBOutlet weak var stockTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        stockValueLoadFunc()
    }
    
    //MARK: - load JSON Function 
    func stockValueLoadFunc() {
        CallFunction.instance.loadStockInformationList(url: url!) { (success, error) in
            self.stockTableView.reloadData()
            if error != nil  {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StockViewController.newProperty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)  as? StockTableViewCell else { return UITableViewCell()}
        let addPropertyNames = StockViewController.newProperty[indexPath.row]
        cell.configureCell(number: addPropertyNames.numberCount, symbol: addPropertyNames.symbolTitle, price: addPropertyNames.priceCount, pricePercent: addPropertyNames.pricechangeCount, volume: addPropertyNames.volumeCount)
        
        
        cell.symbolBtn.addTarget(self, action: #selector(symbolBtnTapped(sender:)), for: .touchUpInside)
        return cell
    }
    @objc func symbolBtnTapped(sender: UIButton) {
        sender.isHighlighted = true
        let touchPointInTableView = self.stockTableView.convert(sender.center, from: sender)
        guard let indexPath = self.stockTableView.indexPathForRow(at: touchPointInTableView) else { return }
        let alert = UIAlertController(title: "Here is CompanyName and Price", message: "\(StockViewController.newProperty[indexPath.row].symbolTitle)  \(StockViewController.newProperty[indexPath.row].priceCount)    \(StockViewController.newProperty[indexPath.row].companyTitle) " , preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

