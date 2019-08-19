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
    @IBOutlet weak var windDiectionView: UIView!
    @IBOutlet weak var windDirectionIcon: UIImageView!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        locationLabel.text = nil
        timeLabel.text = nil
        
        temperatureLabel.text = nil
        currentWeatherIcon.image = nil
        currentWeatherLabel.text = nil
        
        sunriseLabel.text = nil
        sunsetLabel.text = nil
        
        windSpeedLabel.text = nil
        windDiectionView.isHidden = true
        windDirectionIcon.image = nil
        windDirectionLabel.text = nil
        
        humidityLabel.text = nil
        visibilityLabel.text = nil
    }
}

// MARK: - Compose
extension CurrentWeatherView {
    func compose(model: WeatherPresentable) {
        guard let current = model.currentObservation else {
            return
        }
        
        locationLabel.text = model.locationString
        timeLabel.text = model.dateString
        temperatureLabel.text = "\(current.condition.temperature) ℃"
        
        let climate = Climate.fromCode(with: current.condition.code)
        currentWeatherIcon.image = climate.weatherImage
        currentWeatherLabel.text = climate.name
        
        sunriseLabel.text = current.astronomy.sunrise
        sunsetLabel.text = current.astronomy.sunset
        
        windSpeedLabel.text = "\(current.wind.speed) m/s"
        
        if current.wind.speed > 0 {
            windDiectionView.isHidden = false
            let meta = model.windDirectionMeta
            windDirectionIcon.image = meta.directionImage
            windDirectionLabel.text = meta.directionName
        }
        
        humidityLabel.text = "\(current.atmosphere.humidity) %"
        visibilityLabel.text = String(format: "%.2f", current.atmosphere.visibility) + " km"
    }
}
