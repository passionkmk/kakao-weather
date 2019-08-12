//
//  WeatherViewController.swift
//  kakao-weather
//
//  Created by 김민구 on 10/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class WeatherViewController: UIViewController {
    
    var locations: [Spot] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addNoti()
        locations = UserDefaults.standard.getObjectArray(Spot.self, key: UserDefaultsKey.spot)
        d(locations)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Notification
extension WeatherViewController {
    @objc func locationSelect(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else {
            return
        }
        
        if let spot = userInfo["spot"] as? Spot {
            let index = locations.map { $0.name }.firstIndex(of: spot.name)
            if let index = index {
                // TODO: - Move index
            }
            else {
                locations.insert(spot, at: 0)
                UserDefaults.standard.setObjectArray(locations, key: UserDefaultsKey.spot)
                // TODO: - Reload
            }
        }
    }
}

// MARK: - Function
extension WeatherViewController {
    func addNoti() {
        NotificationCenter.default.addObserver(self, selector: #selector(WeatherViewController.locationSelect(notification:)), name: NSNotification.Name(rawValue: NotificationName.locationSelect), object: nil)
    }
}
