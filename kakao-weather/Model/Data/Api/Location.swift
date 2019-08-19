//
//  Location.swift
//  kakao-weather
//
//  Created by we on 09/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

// MARK: - Main
struct Location: Codable {
    let woeid: Int
    let city: String            // 도시명
    let region: String          // 지방
    let country: String         // 국가
    let lat: Double             // 위도
    let long: Double            // 경도
    let timezoneId: String      // 타임존 id
}

// MARK: - CodingKey
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
