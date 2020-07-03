//
//  CustomTabbarController.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation
import UIKit

open class CustomTabbarController: UITabBarController {
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setTabbar()
    }
    
    private func setTabbar() {
        let homeNC = mainStoryboard.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
        let profileNC = mainStoryboard.instantiateViewController(withIdentifier: "ProfileNav") as? UINavigationController
        let view1 = homeNC?.viewControllers.first as? HomeViewController
        let view2 = profileNC?.viewControllers.first as? ProfileViewController
        let icon1 = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        let icon2 = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
        view1?.tabBarItem = icon1
        view2?.tabBarItem = icon2
        
        let controllers = [homeNC, profileNC] as! [UIViewController]
        setViewControllers(controllers, animated: false)
    }
}

extension CustomTabbarController: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
