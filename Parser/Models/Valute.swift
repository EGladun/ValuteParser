//
//  Valute.swift
//  Parser
//
//  Created by Egor on 10.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import ObjectMapper

class Valute: Mappable{
    var code: String?
    var description: String?
    var rate: String?
    var rate_float: NSNumber?
    var symbol: String?
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        code <- map["code"]
        description <- map["description"]
        rate <- map["rate"]
        rate_float <- map["rate_float"]
        symbol <- map["symbol"]
    }
}
