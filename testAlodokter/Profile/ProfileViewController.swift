
//
//  ProfileViewController.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol ProfileViewProtocol: class {
    func setData(data: NSManagedObject)
}

open class ProfileViewController: UIViewController {
    
    public lazy var tableView: UITableView = .init()
    
    private var data: NSManagedObject?
    
    private var presenter: ProfilePresenterProtocol?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilePresenter(self)
        setLayout()
        setBaseView()
        
        presenter?.getData()
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.topMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(self.view.snp.bottomMargin)
        }
    }
    
    private func setBaseView() {
        self.title = "Profile"
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProfileTVCell.self, forCellReuseIdentifier: "profileTVCell")
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileTVCell", for: indexPath) as? ProfileTVCell
        else { return UITableViewCell() }
        
        guard let data = data else {return cell}
        cell.setView(data: data)
        
        return cell
    }
    
}

extension ProfileViewController: ProfileViewProtocol {
    func setData(data: NSManagedObject) {
        self.data = data
        self.tableView.reloadData()
    }
}
