//
//  LocationTableViewCell.swift
//  kakao-weather
//
//  Created by 김민구 on 10/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        locationLabel.text = nil
        locationLabel.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK - Fucntion
extension LocationTableViewCell {
    func compose(data: Spot) {
        
        locationLabel.text = "\(data.country), \(data.name)"
    }
}
