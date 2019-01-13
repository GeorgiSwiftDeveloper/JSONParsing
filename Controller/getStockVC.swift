//
//  ViewController.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/8/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit


class  getStockVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
  

    //MARK: - URL
    let url = URL(string: "https://myibd.investors.com/searchapi/quote/AAPL,FB,GOOGL,TWTR,YHOO,MSFT")
    
    @IBOutlet weak var stockTableView: UITableView!
    
    //MARK:  -Array for keys
    private  var numberArray = [String]()
    private  var symboleArray = [String]()
    private  var nameArray = [String]()
    private  var priceArray = [String]()
    private  var priceChangeArray = [String]()
    private  var volumeArray = [String]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

            loadStockInformationList()
}
    
    //MARK: - Take url and formating  on json && pass json keys on array
    func loadStockInformationList() {
        numberArray.removeAll()
        symboleArray.removeAll()
        nameArray.removeAll()
        priceArray.removeAll()
        priceChangeArray.removeAll()
        volumeArray.removeAll()
        let getUrlInformation = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil  {
                print("Cant find url \(error?.localizedDescription) ")
            }else {
                do {
                    guard   var getStockJsonFormat = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]] else { return }
                    let compactMapStockValues = getStockJsonFormat.compactMap { dictionary in
                        return returnStockValues(myJosn: dictionary)
                    }
                    var index: Int = 0
                    for stockValues in compactMapStockValues {
                        self.numberArray.append("\(index + 1  )")
                        self.symboleArray.append(stockValues.symbol)
                        self.nameArray.append(stockValues.companyName)
                        self.priceArray.append(stockValues.price)
                        self.priceChangeArray.append(stockValues.pricechange)
                        self.volumeArray.append(stockValues.volume)
                        index += 1
                    }
                    
                    self.stockTableView.reloadData()
                    
                }catch{
                    print("Cant find stock values \(error.localizedDescription)")
                }
            }
            
        }
        getUrlInformation.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symboleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)  as? StockTableViewCell else { return UITableViewCell()}
        
        cell.symbolBtn.setTitle(symboleArray[indexPath.row], for: .normal)
        cell.priceLbl.text = priceArray[indexPath.row]
        cell.pricePercentLbl.text = "\(priceChangeArray[indexPath.row]) %"
        cell.volumeChangeLbl.text = FormatPrice.changeformat(format: volumeArray[indexPath.row])
        cell.numberLbl.text =   numberArray[indexPath.row]
        cell.symbolBtn.addTarget(self, action: #selector(symbolBtnTapped(sender:)), for: .touchUpInside)
        
        return cell
    }
    @objc func symbolBtnTapped(sender: UIButton) {
        sender.isHighlighted = true
        let touchPointInTableView = self.stockTableView.convert(sender.center, from: sender)
        guard let indexPath = self.stockTableView.indexPathForRow(at: touchPointInTableView) else { return }
        let alert = UIAlertController(title: "Here is CompanyName and Price", message: "\(symboleArray[indexPath.row]) - \(priceArray[indexPath.row])  - \(nameArray[indexPath.row])", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

