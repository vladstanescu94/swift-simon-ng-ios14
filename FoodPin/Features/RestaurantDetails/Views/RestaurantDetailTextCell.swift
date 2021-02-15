//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 15.02.2021.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }

}
