//
//  RestaurantDetailsViewController.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 08.02.2021.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurantImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    private func setupImageView() {
        restaurantImageView.image = UIImage(named: restaurantImageName)
    }
}
