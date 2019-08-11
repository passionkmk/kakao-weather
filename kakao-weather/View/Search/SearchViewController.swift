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
        let size = self.navigationController?.navigationBar.frame.size.width
        textField.frame = CGRect(x: 0, y: 0, width: size ?? 200, height: 21)
        textField.borderStyle = .roundedRect
        textField.placeholder = "도시 이름을 입력하세요."
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
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var locations: [Spot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addUI()
    }
}

// MARK: - Actions
extension SearchViewController {
    
}

// MARK: - Functions
extension SearchViewController {
    func addUI() {
        navigationItem.titleView = searchTextField
        tableView.register(UINib(nibName: CellName.locationList, bundle: nil), forCellReuseIdentifier: CellName.locationList)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

// MARK: - UITableView Datasource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let spot = locations.get(index: indexPath.row) else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: CellName.locationList, for: indexPath) as! LocationTableViewCell
        cell.compose(data: spot)
        return cell
    }
}

// MARK: - UITableView Delegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let spot = locations.get(index: indexPath.row) else {
            return
        }
        NotificationCenter.default.post(name: Notification.Name(NotificationName.locationSelect), object: nil, userInfo: ["spot": spot])
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITextField Delegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, text.count > 0 else {
            return true
        }
        
        SearchLocal.city(keyword: text) { [weak self] (spots) in
            guard let spots = spots else {
                return
            }
            self?.locations = spots
            self?.tableView.reloadData()
        }
        
        textField.resignFirstResponder()
        return false
    }
}
