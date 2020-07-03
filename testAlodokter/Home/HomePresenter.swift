//
//  HomePresenter.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation
import UIKit

protocol HomePresenterProtcol {
    
    func checkUserLogin(screen: UIViewController)
    func presentLogin(screen from: UIViewController)
}

open class HomePresenter: HomePresenterProtcol {
    
    init() {
        CustomUserDefault.shared.setIsLogin(value: false)
    }
    
    func checkUserLogin(screen: UIViewController) {
        let isLogin = CustomUserDefault.shared.getIsLogin()
        
        if !isLogin {
            presentLogin(screen: screen)
        }
    }
    
    public func presentLogin(screen: UIViewController) {
        guard let nav = screen.storyboard?.instantiateViewController(identifier: "SignNav") as? UINavigationController
        else { return }
        nav.modalPresentationStyle = .fullScreen
        screen.present(nav, animated: true, completion: nil)
    }
    
    
}
