//
//  ViewController.swift
//  ChallengeApp
//
//  Created by Suraj Kodre on 23/08/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import UIKit
import ProgressHUD

class ListViewController: UIViewController {
    
    var userInfoArray: [UserData]?
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupTableView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func fetchData() {
        ProgressHUD.show(loadingMessage)
        let url = URL(string: stringURL)
        NetWorkManager.sharedInstance.fetchDataFromURL(url: url) { (userData, sucess) in
            guard let userInfo = userData else { return }
            CoreDataManager.sharedInstance.saveUserInfo(userInformation: userInfo) { (result) in
                if result {
                    DispatchQueue.main.async {
                        ProgressHUD.dismiss()
                        self.makeGroupByItsType(userData: userInfo)
                    }
                }
            }
        }
    }
    
    private func makeGroupByItsType(userData: [UserData]) {
        let userInfo = userData.sorted(by: { $0.type ?? emptyString < $1.type ?? emptyString })
        self.userInfoArray = userInfo
        self.tableView.reloadData()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserListTableViewCell
        cell?.cellData =  userInfoArray?[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailViewController = UserDetailViewController()
        userDetailViewController.userInfo = userInfoArray?[indexPath.row]
        self.navigationController?.pushViewController(userDetailViewController, animated: true)
    }
}

