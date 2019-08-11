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

    override func viewDidLoad() {
        super.viewDidLoad()
        addNoti()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
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
            d(spot)
        }
    }
}

// MARK: - Function
extension WeatherViewController {
    func addNoti() {
        NotificationCenter.default.addObserver(self, selector: #selector(WeatherViewController.locationSelect(notification:)), name: NSNotification.Name(rawValue: NotificationName.locationSelect), object: nil)
        
    }
}
