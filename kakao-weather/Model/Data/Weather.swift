//
//  Weather.swift
//  kakao-weather
//
//  Created by we on 09/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let location: Location
    let currentObservation: CurrentObservation
    let forecasts: [Forecast]
}

extension Weather {
    enum CodingKeys: String, CodingKey {
        case location
        case currentObservation = "current_observation"
        case forecasts
    }
}
//{
//    "location": {
//                  ...
//    },
//    "current_observation": {
//                  ...
//    },
//    "forecasts": [
//                  ...
//    ]
//}
