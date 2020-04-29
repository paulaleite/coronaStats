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
    var countries: [String]?
    var recovered: [Int]?
    var deaths: [Int]?
    var casesPerMillion: [Int]?
}

class CoronaRequest {
    private static var _shared = CoronaRequest()
    let pathChart = "http://localhost:5050"
    let chartEndpoint = "/chart"
    let pathData = "http://localhost:5050"
    let tableEndpoint = "/table"
    
    private init() {}
    
    class func shared() -> CoronaRequest {
        return _shared
    }
    
    func getGraphImage() -> UIImage {
        var imageOptional: UIImage?
        
        let pathURL = URL(fileURLWithPath: pathChart).appendingPathComponent(chartEndpoint)
        
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
    
    func getData(completionHandler: @escaping (_ dataCodable: DataCodable) -> Void) {
        var dataCountries: DataCodable?
        
        let pathURL = URL(fileURLWithPath: pathData).appendingPathComponent(tableEndpoint)
        
        do {
            let countryData = try Data(contentsOf: pathURL)
            dataCountries = try JSONDecoder().decode(DataCodable.self, from: countryData)
        } catch {
            print("\(error.localizedDescription)")
        }
        
        guard let data = dataCountries else {
            return
        }
        completionHandler(data)
    }
}
