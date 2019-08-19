//
//  CurrentWeatherView.swift
//  kakao-weather
//
//  Created by we on 19/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class CurrentWeatherView: UIView {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var VisibilityLabel: UILabel!
    
    override func awakeFromNib() {
        locationLabel.text = nil
    }
}

// MARK: - Compose
extension CurrentWeatherView {
    func compose(data: WeatherPresentable) {
        // TODO: - Compose
    }
}
