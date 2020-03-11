//
//  TakenJSON.swift
//  Parser
//
//  Created by Egor on 10.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

class TakenJSON: Mappable{
    var bpi: [String: Valute]? = [:]
    var chartName: String? = ""
    var disclaimer: String? = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        bpi <- map["bpi"]
        chartName <- map["chartName"]
        disclaimer <- map["disclaimer"]
    }
}
