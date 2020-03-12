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
import AlamofireObjectMapper

class ViewModel{
    
    var arrayOfMoney: [Money] = []
    
    func doRequest(completion: @escaping () -> Void){
        //запрос
//        request("https://api.coindesk.com/v1/bpi/currentprice.json").validate().responseJSON{ responseJSON in
//            switch responseJSON.result {
//            case .success(let value):
//                if let json = value as? [String: Any]{
//                    let newValue = Mapper<TakenJSON>().map(JSON: json)
//                    newValue?.bpi?.forEach({ (arg0) in
//                        let (_, value) = arg0
//                        self.arrayOfMoney.append(Money(code: value.code ?? "Nothing", rate: value.rate ?? "Nothing"))
//                    })
//                    completion()
//                }
//            case .failure(let error):
//                //распечатка ошибки
//                print(error)
//            }
//        }
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").validate().responseObject { (response: DataResponse<TakenJson>) in
            switch response.result {
            case .success(let value):
                let takenJson = TakenJson()
                takenJson.bpi = value.bpi
                takenJson.disclaimer = value.disclaimer
                takenJson.chartName = value.chartName
                takenJson.time = value.time
                takenJson.bpi?.forEach({ (arg0) in
                    let (_, value) = arg0
                    self.arrayOfMoney.append(Money(code: value.code ?? "Nothing", rate: value.rate ?? "Nothing"))
                })
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct Money{
    var code: String
    var rate: String
}

