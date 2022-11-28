//
//  TabBarController.swift
//  AR_Alpha
//
//  Created by ryo on 2022/11/28.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var itemView = ItemView()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.delegate = self
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        
    }

}
