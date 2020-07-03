//
//  SignPagePresenter.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol SignPagePresenterProtocol: class {
    var view: SignPageViewProtocol? { get set }
    func doLogin(username: String, password: String)
    
}

open class SignPagePresenter: SignPagePresenterProtocol {
    var view: SignPageViewProtocol?
    
    // MARK: injections
    private lazy var coreData = coreDataHelper.shared
    
    init(view: SignPageViewProtocol) {
        self.view = view
    }
    
    func doLogin(username: String, password: String) {
        checkUser(username, password) { [weak self] (success, message) in
            guard let self = self else { return }
            
            if success {
                CustomUserDefault.shared.setIsLogin(value: true)
                self.view?.successLogin(message: message)
            } else {
                self.view?.failedLogin(message: message)
            }
        }
    }
    
    private func checkUser(_ username: String, _ password: String, completion: ((Bool, String) -> Void)? = nil) {
        let dataUser = coreData.fetchUser()
        var success: Bool = false
        var message: String = "User name dan password tidak cocok!"
        
        for data in dataUser {
            guard let dataUsername = data.value(forKey: "username") as? String,
                let dataPassword = data.value(forKey: "password") as? String,
                let phoneNumber = data.value(forKey: "phoneNumber") as? String
            else { continue }

            guard dataUsername.contains(username),
               dataPassword.contains(password)
            else { continue }
           
            success = true
            message = "Berhasil Masuk"
            CustomUserDefault.shared.setPhoneNumber(value: phoneNumber)
            break
        }
        completion?(success, message)
    }
}
