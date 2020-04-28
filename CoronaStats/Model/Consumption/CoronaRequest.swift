//
//  CoronaRequest.swift
//  CoronaStats
//
//  Created by Paula Leite on 28/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation
import UIKit

struct GraphCodable: Codable {
    var imagemGrafico: Data?
}

struct DataCodable: Codable {
    var pais: String?
    var recuperados: String?
    var obitos: String?
    var casosPorMilhao: String?
}

class CoronaRequest {
    private static var _shared = CoronaRequest()
    let path = "localhost:5050"
    let chartEndpoint = "/chart"
    
    private init() {
        getGraphImage()
    }
    
    class func shared() -> CoronaRequest {
        return _shared
    }
    
    func getGraphImage() -> UIImage {
        var imageOptional: UIImage?
        
        let pathURL = URL(fileURLWithPath: path).appendingPathComponent(chartEndpoint)
        
        do {
            let graphData = try Data(contentsOf: pathURL)
            imageOptional = UIImage(data: graphData)
        } catch {
            print("\(error.localizedDescription)")
        }
        
        guard let image = imageOptional else {
            return UIImage()
        }
        
        return image
        
    }
    
    func getData() {
//        let pathURL = "localhost:"
    }
}
