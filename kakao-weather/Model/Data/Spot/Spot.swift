//
//  Spot.swift
//  kakao-weather
//
//  Created by 김민구 on 10/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

// MARK: - Main
struct Spot: Codable {
    let name: String
    let country: String
    let lat: Double
    let lon: Double
}
