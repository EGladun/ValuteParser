//
//  JSON.swift
//  Parser
//
//  Created by Egor on 11.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation

class JSON: Decodable{
    var time: JsonTime!
    var disclaimer: String!
    var chartName: String!
    var bpi: [Bpi]?
}
