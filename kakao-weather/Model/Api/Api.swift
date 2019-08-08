//
//  Api.swift
//  kakao-weather
//
//  Created by we on 08/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

// MARK: - Maim
class Api {
    static let shared: Api = Api()
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
    
    private init() {}
}

// MARK: - Api List
extension Api {
    public func weather(lat: Double, lon: Double) {
        
        let parameter: [String: Any] = [
            "lat": lat,
            "lon": lon
        ]
        Router.weather(parameter: parameter).request { [weak self] (data) in
//            guard
//                let data = data,
//                let result = try? self?.decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
        }
    }
}


