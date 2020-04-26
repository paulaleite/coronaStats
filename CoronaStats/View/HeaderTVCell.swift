//
//  InfoTVCell.swift
//  CoronaStats
//
//  Created by Paula Leite on 26/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class HeaderTVCell: UITableViewCell {

    @IBOutlet weak var recuperadosLabel: UILabel!
    
    @IBOutlet weak var obitosLabel: UILabel!
    
    @IBOutlet weak var casosPorMilhaoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
