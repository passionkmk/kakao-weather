//
//  Extension.swift
//  kakao-weather
//
//  Created by 김민구 on 11/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

// MARK: - Array
extension Array {
    func get(index: Int) -> Element? {
        return index >= 0 && index < self.count ? self[index] : nil
    }
}

// MARK: - UserDefaults
extension UserDefaults {
    func setObjectArray<T: Codable>(_ value: [T], key: String) {
        let data = value.compactMap { try? JSONEncoder().encode($0) }
        set(data, forKey: key)
    }
    
    func getObjectArray<T>(_ type: T.Type, key: String) -> [T] where T: Decodable {
        guard let data = array(forKey: key) as? [Data] else {
            return []
        }
        return data.compactMap { try? JSONDecoder().decode(type, from: $0) }
    }
}


