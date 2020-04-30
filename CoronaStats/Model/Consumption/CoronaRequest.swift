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
    let path = "http://coronaapi-env.eba-ivmpuh8v.us-east-1.elasticbeanstalk.com/"
    let chartEndpoint = "/chart"
    let tableEndpoint = "/table"
    
    private init() {}
    
    class func shared() -> CoronaRequest {
        return _shared
    }
    
    func getGraphImage(countries: [String], completionHandler: @escaping (UIImage?) -> Void) {
        
        var queryItems = [URLQueryItem]()
        for count in 0..<countries.count {
            queryItems.append(URLQueryItem(name: "country\(count+1)", value: countries[count]))
        }
        
        let pathURL = URL(fileURLWithPath: path).appendingPathComponent(chartEndpoint)
        var componentURL = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)
        componentURL?.queryItems = queryItems
        
        guard let url = componentURL?.url else { return }
        do {
            let graphData = try Data(contentsOf: url)
            completionHandler(UIImage(data: graphData))
        } catch {
            print("\(error.localizedDescription)")
        }
        
    }
    
    func getData(completionHandler: @escaping (_ dataCodable: DataCodable) -> Void) {
        var dataCountries: DataCodable?
        
        let pathURL = URL(fileURLWithPath: path).appendingPathComponent(tableEndpoint)
        
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
