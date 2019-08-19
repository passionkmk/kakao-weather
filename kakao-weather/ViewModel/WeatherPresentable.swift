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
    var locationString: String? {
        guard let loc = location else {
            return nil
        }
        return "\(loc.country), \(loc.city)"
    }
    
    var dateString: String? {
        guard let current = currentObservation else {
            return nil
        }
        let date: Date = current.pubDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH시"
        return dateFormatter.string(from: date)
    }
    
    var windDirectionMeta: (directionName: String?, directionImage: UIImage?) {
        guard let current = currentObservation else {
            return (nil, nil)
        }
        
        switch current.wind.direction {
        case 0:
            return ("북", UIImage(named: "wi-direction-down"))
        case 1..<90:
            return ("북동", UIImage(named: "wi-direction-down-left"))
        case 90:
            return ("동", UIImage(named: "wi-direction-left"))
        case 91..<180:
            return ("남동", UIImage(named: "wi-direction-up-left"))
        case 180:
            return ("남", UIImage(named: "wi-direction-up"))
        case 181..<270:
            return ("남서", UIImage(named: "wi-direction-up-right"))
        case 270:
            return ("서", UIImage(named: "wi-direction-right"))
        case 271..<360:
            return ("북서", UIImage(named: "wi-direction-down-right"))
        default:
            return (nil, nil)
        }
    }
}

// MARK: - Extension Fuctions
extension WeatherPresentable {
    
}

