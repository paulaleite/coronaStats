//
//  ProtocolTableView.swift
//  CoronaStats
//
//  Created by Paula Leite on 26/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerDelegate: class {
    func selectedCell(row: Int)
}
