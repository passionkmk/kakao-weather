//
//  Extension.swift
//  kakao-weather
//
//  Created by 김민구 on 11/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

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

// MARK: - UIStackView
extension UIStackView {
    func clean() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}

// MARK: - UIViewConroller
extension UIViewController {
    var navigationBarHeight: CGFloat {
        return navigationController?.navigationBar.frame.height ?? 0
    }
    
    var topSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.top
        } else {
            return topLayoutGuide.length
        }
    }
    
    var bottomSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.bottom
        } else {
            return bottomLayoutGuide.length
        }
    }
}

// MARK: - UIView
extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.leadingAnchor
        }
        return trailingAnchor
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.trailingAnchor
        }
        return self.trailingAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
}
