//
//  Forecast.swift
//  kakao-weather
//
//  Created by we on 09/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

struct Forecast: Codable {      // 예보
    let day: String
    let date: Date
    let low: Int
    let high: Int
    let text: String
    let code: Int
}

//{
//    "day": "Fri",
//    "date": 1565276400,
//    "low": 25,
//    "high": 33,
//    "text": "Thunderstorms",
//    "code": 4
//}
