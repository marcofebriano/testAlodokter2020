//
//  ProfilePresenter.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol ProfilePresenterProtocol {
    var view: ProfileViewProtocol? { get set }
    func getData()
}

open class ProfilePresenter: ProfilePresenterProtocol {
    var view: ProfileViewProtocol?
    
    init(_ view: ProfileViewProtocol) {
        self.view = view
    }
    
    func getData() {
        checkDataUser { [weak self] (data) in
            guard let self = self else { return }
            self.view?.setData(data: data)
        }
    }
    
    private func checkDataUser(completion: ((NSManagedObject) -> Void)? = nil) {
        let datas = coreDataHelper.shared.fetchUser()
        let phoneNumber = CustomUserDefault.shared.getPhoneNumber()
        for data in datas {
            guard let dataPhone = data.value(forKey: "phoneNumber") as? String else { break }
            guard dataPhone.contains(phoneNumber) else { continue }
            completion?(data)
            break
        }
    }
}
