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
    private let index: Int
    
    init(_ spot: Spot, index: Int) {
        self.spot = spot
        self.index = index
    }
}

// MARK: - Public Funtion
extension WeatherViewModel {
    public func loadData(_ completion: @escaping (_ index: Int?) -> Void) {
        Api.shared.weather(lat: spot.lat, lon: spot.lon) { [weak self] (weather) in
            self?.location = weather?.location
            self?.currentObservation = weather?.currentObservation
            self?.forecasts = weather?.forecasts ?? []
            d((weather))
            completion(self?.index)
        }
    }
    
    public func loadCell(with collecionView: UICollectionView, indexPath: IndexPath) -> WeatherCollectionViewCell {
        let cell = collecionView.dequeueReusableCell(withReuseIdentifier: NibName.weatherCell, for: indexPath) as! WeatherCollectionViewCell
        cell.compose(model: self)
        return cell
    }
}

// MARK: - Private Functions
extension WeatherViewModel {
    
}


