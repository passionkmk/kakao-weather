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
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var locations: [Spot] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addNoti()
        addUI()
        locations = UserDefaults.standard.getObjectArray(Spot.self, key: UserDefaultsKey.spot)
        d(locations)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setLayout()
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
    
    func addUI() {
        collectionView.register(UINib(nibName: CellName.weatherList, bundle: nil), forCellWithReuseIdentifier: CellName.weatherList)
        view.addSubview(collectionView)
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

// MARK: - UICollectionView DataSource
extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellName.weatherList, for: indexPath) as! WeatherCollectionViewCell
        return cell
    }
    
    
}

// MARK: - UICollectionView Delegates
extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
