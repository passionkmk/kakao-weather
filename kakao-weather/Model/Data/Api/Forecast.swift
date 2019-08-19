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

extension Forecast {
    var dayOfWeek: String {
        switch self.day {
        case "Mon":
            return "월요일"
        case "Tue":
            return "화요일"
        case "Wed":
            return "수요일"
        case "Thu":
            return "목요일"
        case "Fri":
            return "금요일"
        case "Sat":
            return "토요일"
        case "Sun":
            return "일요일"
        default:
            return ""
        }
    }
}




//{
//    "day": "Fri",
//    "date": 1565276400,
//    "low": 25,
//    "high": 33,
//    "text": "Thunderstorms",
//    "code": 4
//}
