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
}
