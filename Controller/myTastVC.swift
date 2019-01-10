//
//  ViewController.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/8/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit


struct JsonObj {
    var symbol: String
    var nameCompany: String
    var price: String
    var pricechange:  String
    var volume: String
    
    
    
}



extension JsonObj {
    init?(myJosn: [String: Any]) {
        var symbol = myJosn["Symbol"] as? String ?? ""
        let  nameCompany = myJosn["CompanyName"] as? String ?? ""
        let  price = myJosn["Price"] as? String ?? ""
        let pricechange = myJosn["PricePercentChange"] as? String ?? ""
        let volume = myJosn["Volume"] as? String ?? ""
        
        self.symbol = symbol
        self.nameCompany = nameCompany
        self.price = price
        self.pricechange = pricechange
        self.volume = volume
    }
}



class myTastVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
  
    //MARK: URL
   let jsonurlString = URL(string: "https://myibd.investors.com/searchapi/quote/AAPL,FB,GOOGL,TWTR,YHOO,MSFT")

    @IBOutlet weak var myTableView: UITableView!
    

    var newObject = [JsonObj]()
    
    //MARK: Array for keys
    var numberArray = [String]()
    var symboleArray = [String]()
    var nameArray = [String]()
    var priceArray = [String]()
    var priceChangeArray = [String]()
    var volumeArray = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: TableView Delegate and Datasource
        self.myTableView.delegate = self
        self.myTableView.dataSource = self

            loadList()
           
        
            }


    //MARK: Take url and formating  on json && pass json keys on array
    func loadList() {
        let task = URLSession.shared.dataTask(with: jsonurlString!) { (data, response, error) in
            if error != nil  {
                print("error here")
            }else {
                do {
        
                    guard   var myJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]] else { return }
                        print(myJson)
                    
                    let object = myJson.compactMap { dictionary in
                        return JsonObj(myJosn: dictionary)
                    }
                        print(object[1])
                        var index: Int = 0
            for myobj in object {
                        self.numberArray.append("\(index + 1  )")
                        self.symboleArray.append(myobj.symbol)
                        print(self.symboleArray[index])
                        
                        self.nameArray.append(myobj.nameCompany)
                        
                        self.priceArray.append(myobj.price)
                        
                        self.priceChangeArray.append(myobj.pricechange)
                        self.volumeArray.append(myobj.volume)
                        index += 1
                        
                    
                        
                        
                    }
                    
                    self.myTableView.reloadData()
                    
                }catch{

                }
            }

        }
        task.resume()
    }
    
   
    
    func changeformat(format: String) -> String{
        if format.characters.count <= 3 {
            return format
        }
        let reverseText = String(format.reversed())
        
        var temp: String = ""
        var index: Int = 0
       
            for indexfor  in 0...reverseText.count - 1 {
                
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symboleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)  as? TaskTableViewCell else { return UITableViewCell()}
        
        cell.symbolLbl?.text = symboleArray[indexPath.row]
//        cell.nameLbl.text = nameArray[indexPath.row]
        cell.priceLbl.text = priceArray[indexPath.row]
        cell.priceProcentLbl.text = "\(priceChangeArray[indexPath.row]) %"
        cell.volAvgDlyLbl.text =    changeformat(format: volumeArray[indexPath.row])
        
        cell.numberLbl.text = numberArray[indexPath.row]

        
        if cell.symbolLbl.gestureRecognizers?.count ?? 0 ==  0 {
           
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imgTapped(sender:)))
            cell.symbolLbl.addGestureRecognizer(tapGesture)
            cell.symbolLbl.isUserInteractionEnabled = true
        }
        return cell
    }
    
    //MARK: GesterRecognizer function
  @objc  func imgTapped(sender: UITapGestureRecognizer) {
    
        print("testing-testing")
        guard let tappedView = sender.view else {
        return
        }
        let touchPointInTableView = self.myTableView.convert(tappedView.center, from: tappedView)
        guard let indexPath = self.myTableView.indexPathForRow(at: touchPointInTableView) else {
        return
    }
        print("Selected item at indexPath \(indexPath)")
        let alertController = UIAlertController(title: "Here is CompanyName and Price", message: "\(symboleArray[indexPath.row]) - \(priceArray[indexPath.row])  - \(nameArray[indexPath.row])", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        
    }

}

