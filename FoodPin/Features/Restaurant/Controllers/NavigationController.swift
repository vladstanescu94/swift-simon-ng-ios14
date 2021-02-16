//
//  NavigationController.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 16.02.2021.
//

import UIKit

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

}
