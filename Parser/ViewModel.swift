//
//  ViewModel.swift
//  Parser
//
//  Created by Egor on 10.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ViewModel{
    
    var arrayOfMoney: [Money] = []
    
    func doRequest(completion: @escaping () -> Void){
        //запрос
        request("https://api.coindesk.com/v1/bpi/currentprice.json").validate().responseJSON{ responseJSON in
            switch responseJSON.result {
            case .success(let value):
                if let json = value as? [String: Any]{
                    let newValue = Mapper<TakenJSON>().map(JSON: json)
                    newValue?.bpi?.forEach({ (arg0) in
                        let (_, value) = arg0
                        self.arrayOfMoney.append(Money(code: value.code ?? "Nothing", rate: value.rate ?? "Nothing"))
                    })
                    completion()
                }
            case .failure(let error):
                //распечатка ошибки
                print(error)
            }
        }
    }
}

struct Money{
    var code: String
    var rate: String
}

