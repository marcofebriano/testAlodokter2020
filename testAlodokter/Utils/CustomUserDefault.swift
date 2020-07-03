//
//  CustomUserDefault.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation

open class CustomUserDefault {
    public static var shared = CustomUserDefault()
    
    private var keyIsLogin: String = "isLogin"
    private var keyNumber: String = "number"
    
    func setIsLogin(value: Bool) {
        UserDefaults.standard.set(value, forKey: keyIsLogin)
    }
    func getIsLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: keyIsLogin)
    }
    
    func setPhoneNumber(value: String) {
        UserDefaults.standard.set(value, forKey: keyNumber)
    }
    func getPhoneNumber() -> String {
        return UserDefaults.standard.string(forKey: keyNumber) ?? ""
    }
}
