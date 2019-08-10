//
//  SearchViewController.swift
//  kakao-weather
//
//  Created by 김민구 on 10/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import UIKit

// MARK: - Main
class SearchViewController: UIViewController {
    
    lazy var searchTextField: UITextField = { [unowned self] in
        let textField = UITextField()
        textField.placeholder = "도시 또는 우편번호를 입력하세요."
        textField.returnKeyType = .search
        textField.tintColor = .black
        textField.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        textField.delegate = self
        return textField
    }()
    
    lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - Actions
extension SearchViewController {
    
}

// MARK: - Functions
extension SearchViewController {
    
}

// MARK: - UITableView Datasource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UITableView Delegate
extension SearchViewController: UITableViewDelegate {
    
}

// MARK: - UITextField Delegate
extension SearchViewController: UITextFieldDelegate {
    
}
