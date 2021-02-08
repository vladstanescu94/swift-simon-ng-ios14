//
//  RestaurantDetailsHeaderView.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 08.02.2021.
//

import UIKit

class RestaurantDetailsHeaderView: UIView {
    
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var heartButton: UIButton!

}
