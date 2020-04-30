//
//  GeneralVC.swift
//  CoronaStats
//
//  Created by Paula Leite on 26/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class GeneralVC: UIViewController {
    
    @IBOutlet weak var graphImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoadingAlert()
        CoronaRequest.shared().getGraphImage(countries: ["Brazil", "USA", "UK", "Spain"]) { (img) in
            DispatchQueue.main.async {
                self.graphImageView.image = img
                self.removeLoadingAlert()
            }
        }
        
    }
    
    @IBAction func countryNames(_ unwindsegue: UIStoryboardSegue) {
        guard let selectCountriesVC = unwindsegue.source as? SelectCountriesTVC else {
            return
        }
        
        CoronaRequest.shared().getGraphImage(countries: selectCountriesVC.selected) { (img) in
            DispatchQueue.main.async {
                self.graphImageView.image = img
            }
        }
    }
    
}
