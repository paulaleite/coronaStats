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
        
//        showLoadingAlert()
        
        self.tableViewDelegate = TableViewDelegate(withDelegate: self)
        self.tableViewDataSource = TableViewDataSource(nomePais: ["Brasil", "EUA"], qtdRecuperados: ["214", "243"], qtdObtios: ["8", "20"], qtdCasosPorMilhao: ["3.7", "8.2"])
        
        self.tableView.delegate = self.tableViewDelegate
        self.tableView.dataSource = self.tableViewDataSource
    }
    
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }

}
