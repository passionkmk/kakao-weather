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
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .automatic
        } else {
            automaticallyAdjustsScrollViewInsets = true
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
        loadModel()
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
                let point = CGPoint(x: collectionView.frame.width * CGFloat(index), y: 0)
                DispatchQueue.main.async { [weak self] in
                    self?.collectionView.setContentOffset(point, animated: true)
                }
            }
            else {
                let viewModel = WeatherViewModel(spot, index: 0)
                viewModels.forEach { $0.index += 1 }
                viewModels.insert(viewModel, at: 0)
                viewModels.get(index: 0)?.loadData { [weak self] (_) in
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                        DispatchQueue.main.async {
                            self?.collectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
                        }
                    }
                }
                locations.insert(spot, at: 0)
                UserDefaults.standard.setObjectArray(locations, key: UserDefaultsKey.spot)
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
        navigationItem.title = "날씨"
        collectionView.register(UINib(nibName: NibName.weatherCell, bundle: nil), forCellWithReuseIdentifier: NibName.weatherCell)
        view.addSubview(collectionView)
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
            ])
        collectionView.reloadData()
    }
    
    func setModel() {
        locations = UserDefaults.standard.getObjectArray(Spot.self, key: UserDefaultsKey.spot)
        viewModels = locations.enumerated().map { WeatherViewModel($1, index: $0) }
    }
    
    func loadModel() {
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
        let cell = model.loadCell(with: collectionView, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionView Delegates
extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

// MARK: - WeatherRefreshDelegate
extension WeatherViewController: WeatherRefreshDelegate {
    func refresh(index: Int) {
        guard let model = viewModels.get(index: index) else {
            return
        }
        model.loadData { [weak self] (index) in
            guard let index = index else {
                return
            }
            DispatchQueue.main.async {
                self?.collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
            }
        }
    }
}
