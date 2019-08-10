//
//  Extension.swift
//  kakao-weather
//
//  Created by 김민구 on 11/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

extension Array {
    func get(index: Int) -> Element? {
        return index >= 0 && index < self.count ? self[index] : nil
    }
}
