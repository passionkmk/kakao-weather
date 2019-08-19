//
//  ForecastWeatherView.swift
//  kakao-weather
//
//  Created by we on 19/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class ForecastWeatherView: UIView {
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        stackView.clean()
    }
}

// MARK: - Compose
extension ForecastWeatherView {
    func compose(model: WeatherPresentable) {
        guard model.forecasts.count > 0 else {
            return
        }
        model.forecasts.forEach { [weak self] (weather) in
            let forecastView = Bundle.main.loadNibNamed(NibName.forecastView, owner: self)?.first as! ForecastView
            forecastView.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
            forecastView.compose(data: weather)
            self?.stackView.addArrangedSubview(forecastView)
        }
    }
}
