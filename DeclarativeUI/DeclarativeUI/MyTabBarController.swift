//
//  MyTabBarController.swift
//  DeclarativeUI
//
//  Created by Abdan Zaki Alifian on 04/05/24.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let firstViewController = ViewController()
        let secondViewController = AnotherViewController()
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Menu Lain", image: .actions, tag: 1)
        
        viewControllers = [firstViewController, secondViewController]
    }
}
