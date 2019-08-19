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
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        return collectionView
    }()
    
    var locations: [Spot] = []
    var viewModels: [WeatherViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addNoti()
        addUI()
        setModel()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModels.forEach { [weak self] (model) in
            model.loadData({ (index) in
                guard let index = index else {
                    return
                }
                DispatchQueue.main.async {
                    self?.collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
                }
            })
        }
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
        collectionView.register(UINib(nibName: NibName.weatherCell, bundle: nil), forCellWithReuseIdentifier: NibName.weatherCell)
        view.addSubview(collectionView)
    }
    
    func setLayout() {
        collectionView.contentInset = UIEdgeInsets(top: navigationBarHeight, left: 0, bottom: 0, right: 0)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func setModel() {
        locations = UserDefaults.standard.getObjectArray(Spot.self, key: UserDefaultsKey.spot)
        viewModels = locations.enumerated().map { WeatherViewModel($1, index: $0) }
    }
}

// MARK: - UICollectionView DataSource
extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = viewModels.get(index: indexPath.item) else {
            return UICollectionViewCell()
        }
        return model.loadCell(with: collectionView, indexPath: indexPath)
    }
}

// MARK: - UICollectionView Delegates
extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
