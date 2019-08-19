//
//  CurrentObservation.swift
//  kakao-weather
//
//  Created by we on 09/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

struct CurrentObservation: Codable {
    let wind: Wind
    let atmosphere: Atmosphere
    let astronomy: Astronomy
    let condition: Condition
    let pubDate: Date
}

struct Wind: Codable {      // 바람
    let chill: Int          // 풍랭
    let direction: Int      // 방향
    let speed: Int          // 풍속
}

struct Atmosphere: Codable {    // 대기
    let humidity: Int           // 습도
    let visibility: Double      // 가시성
    let pressure: Int           // 압력
    let rising: Int             // 대기상승
}

struct Astronomy: Codable {     // 천문
    let sunrise: String         // 일출
    let sunset: String          // 일몰
}

struct Condition: Codable {
    let text: String
    let code: Int
    let temperature: Int        // 온도
}

//"current_observation": {
//    "wind": {
//        "chill": 33,
//        "direction": 255,
//        "speed": 7
//    },
//    "atmosphere": {
//        "humidity": 60,
//        "visibility": 16.1,
//        "pressure": 997,
//        "rising": 0
//    },
//    "astronomy": {
//        "sunrise": "5:43 am",
//        "sunset": "7:31 pm"
//    },
//    "condition": {
//        "text": "Partly Cloudy",
//        "code": 30,
//        "temperature": 33
//    },
//    "pubDate": 1565323200
//},
