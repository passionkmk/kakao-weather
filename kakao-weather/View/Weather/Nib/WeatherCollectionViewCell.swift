//
//  WeatherCollectionViewCell.swift
//  kakao-weather
//
//  Created by we on 12/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class WeatherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(WeatherCollectionViewCell.refresh), for: .valueChanged)
        return refreshControl
    }()
    
    private var index: Int?
    weak var delegate: WeatherRefreshDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        addUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.clean()
    }
}

// MARK: - Compose
extension WeatherCollectionViewCell {
    public func compose(model: WeatherViewModel) {
        if model.location != nil && model.currentObservation != nil {
            let currentWeatherView = Bundle.main.loadNibNamed(NibName.currentWeatherView, owner: self)?.first as! CurrentWeatherView
            currentWeatherView.compose(model: model)
            stackView.addArrangedSubview(currentWeatherView)
        }
        
        if model.forecasts.count > 0 {
            let forecastWeatherView = Bundle.main.loadNibNamed(NibName.forecastWeatherView, owner: self)?.first as! ForecastWeatherView
            forecastWeatherView.compose(model: model)
            stackView.addArrangedSubview(forecastWeatherView)
        }
        
        index = model.index
    }
}

// MARK: - Action
extension WeatherCollectionViewCell {
    @objc func refresh() {
        guard let index = index else {
            return
        }
        delegate?.refresh(index: index)
        DispatchQueue.main.async { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
}

// MARK: - Function
extension WeatherCollectionViewCell {
    private func addUI() {
        scrollView.addSubview(stackView)
        scrollView.addSubview(refreshControl)
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
    }
}
