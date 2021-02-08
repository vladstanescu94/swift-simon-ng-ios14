//
//  RestaurantDetailsViewController.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 08.02.2021.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantDescriptionView: UIView!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupImageView()
        setupDetailsDescriptionView()
    }
    
    private func setupNavigation() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupImageView() {
        restaurantImageView.image = UIImage(named: restaurant.image)
    }
    
    private func setupDetailsDescriptionView() {
        guard let detailsView = restaurantDescriptionView as? RestaurantDetailsDescriptionView else {
            return
        }
        
        detailsView.restaurantName.text = restaurant.name
        detailsView.restaurantType.text = restaurant.type
        detailsView.restaurantLocation.text = restaurant.location
    }
}
