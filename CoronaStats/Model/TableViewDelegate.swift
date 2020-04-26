//
//  TableViewDelegate.swift
//  CoronaStats
//
//  Created by Paula Leite on 26/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation
import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var delegate: ViewControllerDelegate?
    
    init(withDelegate delegate: ViewControllerDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? HeaderTVCell
        headerCell?.recuperadosLabel.text = "Recuperados"
        headerCell?.obitosLabel.text = "Óbitos"
        headerCell?.casosPorMilhaoLabel.text = "Casos/Milhão"
        
        guard let safeCell = headerCell else {
            return UITableViewCell()
        }
        
        return safeCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? HeaderTVCell
        
        return headerCell?.bounds.height ?? 44
    }
}
