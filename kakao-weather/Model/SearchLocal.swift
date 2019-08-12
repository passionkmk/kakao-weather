//
//  SearchLocal.swift
//  kakao-weather
//
//  Created by 김민구 on 10/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit
import MapKit

// MARK: - Main
struct SearchLocal {
    private init() {}
}

// MARK: - Functions
extension SearchLocal {
    static func city(keyword: String, completion: @escaping (_ spot: [Spot]?) -> Void) {
        let geo: CLGeocoder = CLGeocoder()
        geo.geocodeAddressString(keyword) { (marks, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            guard let spots = marks else {
                completion([])
                return
            }
            let places = spots.compactMap({ (mark) -> Spot? in
                guard
                    let loc = mark.location,
                    let name = mark.name,
                    let country = mark.country else {
                    return nil
                }
                let lat = loc.coordinate.latitude
                let lon = loc.coordinate.longitude

                return Spot(name: name, country: country, lat: lat, lon: lon)
            })
            completion(places)
        }
    }
}


