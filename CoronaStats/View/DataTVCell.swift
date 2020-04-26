//
//  DataTVCell.swift
//  CoronaStats
//
//  Created by Paula Leite on 26/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class DataTVCell: UITableViewCell {
    
    @IBOutlet weak var nomePaisLabel: UILabel!
    
    @IBOutlet weak var recuperadosLabel: UILabel!
    
    @IBOutlet weak var obitosLabel: UILabel!
    
    @IBOutlet weak var casosPorMilhaoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
