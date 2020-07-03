//
//  HomeViewController.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation
import UIKit

open class HomeViewController: UIViewController {
    
    public lazy var tableView: UITableView = .init()
    
    var imageNames: [String] = ["kitten1","kitten2","kitten3"]
    
    var presenter: HomePresenterProtcol?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = HomePresenter()
        setLayout()
        setBaseView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.checkUserLogin(screen: self)
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
        self.title = "Home"
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTVCell.self, forCellReuseIdentifier: "homeTVCell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeTVCell", for: indexPath) as? HomeTVCell
        else { return UITableViewCell() }
        
        let image = UIImage(named: imageNames[indexPath.row])
        cell.setImage(image: image)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
