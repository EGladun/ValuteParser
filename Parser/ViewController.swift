//
//  ViewController.swift
//  Parser
//
//  Created by Egor on 10.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.startAnim()
        viewModel.doRequest{
            self.rates = self.viewModel.arrayOfMoney
            self.tableView?.reloadData()
            self.stopAnim()
        }
    }
    
    var rates: [Money] = []
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var isAnimated: Bool = false
    
    let identifier = "MoneyTableViewCell"
    let viewModel = ViewModel()
    
    func startAnim(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopAnim(){
        self.activityIndicator.stopAnimating()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rates.count / self.rates.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MoneyTableViewCell
        if self.rates.count > 0{
            let eachRate = self.rates[indexPath.section]
            //cell.rateLabel?.text = (eachRate.rate as String)
            cell.awakeFromNib(rate: eachRate.rate as String)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.rates[section].code
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //инициализация хедера отдельным вью, передача текста для лейбла
        let headerView = HeaderForTableView(text: self.rates[section].code)
        switch section{
        case 0:
            headerView.backgroundColor = UIColor.green
        case 1:
            headerView.backgroundColor = UIColor.yellow
        case 2:
            headerView.backgroundColor = UIColor.orange
        default:
            headerView.backgroundColor = UIColor.gray
        }
        
        return headerView
    }
    
    //press method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Pressed at \(indexPath.section) \(indexPath.row)")
    }
}


