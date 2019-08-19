//
//  WeatherViewModel.swift
//  kakao-weather
//
//  Created by we on 13/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class WeatherViewModel: WeatherPresentable {
    var location: Location? = nil
    var currentObservation: CurrentObservation? = nil
    var forecasts: [Forecast] = []
    
    private let spot: Spot
    
    init(_ spot: Spot) {
        self.spot = spot
        update()
    }
}

// MARK: - Public Funtion
extension WeatherViewModel {
    public func refresh() {
        update()
    }
    
    public func loadCell(with collecionView: UICollectionView, indexPath: IndexPath) -> WeatherCollectionViewCell {
        let cell = collecionView.dequeueReusableCell(withReuseIdentifier: NibName.weatherCell, for: indexPath) as! WeatherCollectionViewCell
        cell.compose(data: self)
        return cell
    }
}

// MARK: - Private Functions
extension WeatherViewModel {
    private func update() {
        Api.shared.weather(lat: spot.lat, lon: spot.lon) { [weak self] (weather) in
            self?.location = weather?.location
            self?.currentObservation = weather?.currentObservation
            self?.forecasts = weather?.forecasts ?? []
        }
    }
}


