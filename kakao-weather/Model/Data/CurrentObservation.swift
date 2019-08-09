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
    let pubDate: Int
}

struct Wind: Codable {
    let chill: Int
    let direction: Int
    let speed: Int
}

struct Atmosphere: Codable {
    let humidity: Int
    let visibility: Double
    let pressure: Int
    let rising: Int
}

struct Astronomy: Codable {
    let sunrise: String
    let sunset: String
}

struct Condition: Codable {
    let text: String
    let code: Int
    let temperature: Int
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
