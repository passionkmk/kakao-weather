//
//  WeatherPresentable.swift
//  kakao-weather
//
//  Created by we on 13/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
protocol WeatherPresentable {
    var location: Location? { get }
    var currentObservation: CurrentObservation? { get }
    var forecasts: [Forecast] { get }
}

// MARK: - Extension Value
extension WeatherPresentable {
    
}

// MARK: - Extension Fuctions
extension WeatherPresentable {
    
}

