//
//  WeatherRefreshDelegate.swift
//  kakao-weather
//
//  Created by 김민구 on 20/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

// MARK: - Main
protocol WeatherRefreshDelegate: class {
    func refresh(index: Int)
}
