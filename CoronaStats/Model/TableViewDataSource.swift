//
//  TableViewDataSource.swift
//  CoronaStats
//
//  Created by Paula Leite on 26/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    var nomePais = [String]()
    var qtdRecuperados = [Int]()
    var qtdObtios = [Int]()
    var qtdCasosPorMilhao = [Int]()
    
    init(nomePais: [String], qtdRecuperados: [Int], qtdObtios: [Int], qtdCasosPorMilhao: [Int]) {
        self.nomePais = nomePais
        self.qtdRecuperados = qtdRecuperados
        self.qtdObtios = qtdObtios
        self.qtdCasosPorMilhao = qtdCasosPorMilhao
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nomePais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as? DataTVCell
        cell?.recuperadosLabel.text = String(self.qtdRecuperados[indexPath.row])
        cell?.obitosLabel.text = String(self.qtdObtios[indexPath.row])
        cell?.casosPorMilhaoLabel.text = String(self.qtdCasosPorMilhao[indexPath.row])
        cell?.nomePaisLabel.text = self.nomePais[indexPath.row]
        
        guard let safeCell = cell else {
            return UITableViewCell()
        }
        
        return safeCell
    }
}
