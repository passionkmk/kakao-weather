//
//  Location.swift
//  kakao-weather
//
//  Created by we on 09/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

struct Location: Codable {
    let woeid: Int
    let city: String
    let region: String
    let country: String
    let lat: Double
    let long: Double
    let timezoneId: String
}

extension Location {
    enum CodingKeys: String, CodingKey {
        case woeid
        case city
        case region
        case country
        case lat
        case long
        case timezoneId = "timezone_id"
    }
}

//"location": {
//    "woeid": 28835148,
//    "city": "Seoul",
//    "region": " Seoul",
//    "country": "South Korea",
//    "lat": 37.507511,
//    "long": 127.058128,
//    "timezone_id": "Asia/Seoul"
//}
