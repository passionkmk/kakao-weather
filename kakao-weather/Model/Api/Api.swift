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
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
    
    private init() {}
}

// MARK: - Api List
extension Api {
    public func weather(lat: Double, lon: Double, completion: @escaping (_ data: Weather?) -> Void){
        
        let parameter: [String: Any] = [
            "lat": lat,
            "lon": lon
        ]
        
        Router.weather(parameter: parameter).request { [weak self] (data) in
            guard
                let data = data,
                let result = try? self?.decoder.decode(Weather.self, from: data) else {
                    completion(nil)
                    return
            }
            completion(result)
            return
        }
    }
}


