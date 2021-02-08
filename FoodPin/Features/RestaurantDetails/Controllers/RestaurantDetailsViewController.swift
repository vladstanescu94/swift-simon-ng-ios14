//
//  RestaurantDetailsViewController.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 08.02.2021.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationItem.largeTitleDisplayMode = .never
    }
}
