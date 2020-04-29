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
        
        showLoadingAlert()
        
        CoronaRequest.shared().getData { (dataCodable) in
            DispatchQueue.main.async {
                guard let countryNames = dataCodable.country
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
                
                self.tableViewDelegate = TableViewDelegate(withDelegate: self)
                self.tableViewDataSource = TableViewDataSource(nomePais: countryNames, qtdRecuperados: recovered, qtdObtios: deaths, qtdCasosPorMilhao: casesPerMillion)
                
                self.removeLoadingAlert()
            }
        }
        
        self.tableView.delegate = self.tableViewDelegate
        self.tableView.dataSource = self.tableViewDataSource
        
    }
    
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }

}
