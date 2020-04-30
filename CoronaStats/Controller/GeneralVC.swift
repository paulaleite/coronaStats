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
        
        DispatchQueue.main.async {
            self.graphImageView.image = CoronaRequest.shared().getGraphImage()
            self.removeLoadingAlert()
        }
    }
    
    @IBAction func addNewGraph(_ sender: Any) {
        
    }
    
}
