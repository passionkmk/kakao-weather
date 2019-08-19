//
//  ForecastView.swift
//  kakao-weather
//
//  Created by we on 19/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class ForecastView: UIView {

    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var highTemperature: UILabel!
    @IBOutlet weak var lowTemperature: UILabel!
    
    override func awakeFromNib() {
        dayOfWeekLabel.text = nil
        weatherImageView.image = nil
        highTemperature.text = nil
        lowTemperature.text = nil
    }
}

// MARK: - Compose
extension ForecastView {
    func compose(data: Forecast) {
        dayOfWeekLabel.text = data.dayOfWeek
        weatherImageView.image = Climate.fromCode(with: data.code).weatherImage
        highTemperature.text = "\(data.high)℃"
        lowTemperature.text = "\(data.low)℃"
    }
}
