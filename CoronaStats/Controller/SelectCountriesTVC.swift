//
//  SelectCountriesTVC.swift
//  CoronaStats
//
//  Created by Paula Leite on 29/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class SelectCountriesTVC: UITableViewController {

    var countryNamesString = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoronaRequest.shared().getData { (dataCodable) in
            DispatchQueue.main.async {
                guard let countryNames = dataCodable.countries
                    else {
                    return
                }
                
                self.countryNamesString = countryNames
                
                self.tableView.reloadData()
                
                self.removeLoadingAlert()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryNamesString.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryListCell") as? CountriesTVCell
        cell?.countryNameLabel.text = String(self.countryNamesString[indexPath.row])
        
        guard let safeCell = cell else {
            return UITableViewCell()
        }
        
        return safeCell
    }

}
