//
//  ViewController.swift
//  kakao-weather
//
//  Created by 김민구 on 07/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Api.shared.weather(lat: 37.509, lon: 127.063) { (data) in
            d(data)
        }
        // Do any additional setup after loading the view.
    }


}

