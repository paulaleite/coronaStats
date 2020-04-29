//
//  CountryVC.swift
//  CoronaStats
//
//  Created by Paula Leite on 26/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class CountryVC: UIViewController, ViewControllerDelegate {
    
    var tableViewDataSource: TableViewDataSource?
    var tableViewDelegate: TableViewDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewDelegate = TableViewDelegate(withDelegate: self)
        self.tableViewDataSource = TableViewDataSource()
        
        self.tableView.delegate = self.tableViewDelegate
        self.tableView.dataSource = self.tableViewDataSource
        
        showLoadingAlert()
        
        CoronaRequest.shared().getData { (dataCodable) in
            DispatchQueue.main.async {
                guard let countryNames = dataCodable.countries
                    else {
                    return
                }
                guard let recovered = dataCodable.recovered else {
                    return
                }
                guard let deaths = dataCodable.deaths else {
                    return
                }
                guard let casesPerMillion = dataCodable.casesPerMillion else {
                    return
                }
                
                self.tableViewDataSource?.updateDataSource(nomePais: countryNames, qtdRecuperados: recovered, qtdObtios: deaths, qtdCasosPorMilhao: casesPerMillion)
                
                self.tableView.reloadData()
                
                self.removeLoadingAlert()
            }
        }
    }
    
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }

}
