//
//  WeatherCollectionViewCell.swift
//  kakao-weather
//
//  Created by we on 12/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class WeatherCollectionViewCell: UICollectionViewCell {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        addUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.clean()
    }
}

// MARK: - Public Function
extension WeatherCollectionViewCell {
    public func compose(model: WeatherPresentable) {
        let currentWeatherView = Bundle.main.loadNibNamed(NibName.currentWeatherView, owner: self)?.first as! CurrentWeatherView
        currentWeatherView.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
        currentWeatherView.compose(model: model)
        
        let forecastWeatherView = Bundle.main.loadNibNamed(NibName.forecastWeatherView, owner: self)?.first as! ForecastWeatherView
        forecastWeatherView.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
        forecastWeatherView.compose(model: model)
        
        stackView.addArrangedSubview(currentWeatherView)
        stackView.addArrangedSubview(forecastWeatherView)
    }
}

// MARK: - Private Function
extension WeatherCollectionViewCell {
    private func addUI() {
        addSubview(stackView)
    }
    
    private func addLayout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
