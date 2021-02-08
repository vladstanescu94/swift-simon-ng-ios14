//
//  RestaurantTableViewController+Extensions.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 05.02.2021.
//

import UIKit

extension RestaurantTableViewController {
    // MARK: - UITableViewDiffableDataSource
    
    func configureDataSource() -> RestaurantDiffableDataSource {
        let cellIdentifier = "favoritecell"
        
        let dataSource = RestaurantDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, restaurant in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
                
                cell.nameLabel.text = restaurant.name
                cell.thumbnailImageView.image = UIImage(named: restaurant.image)
                cell.locationLabel.text = restaurant.location
                cell.typeLabel.text = restaurant.type
                cell.favoriteImage.isHidden = true
                
                return cell
            }
        )
        
        return dataSource
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let restaurant = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([restaurant])
            self.dataSource.apply(snapshot, animatingDifferences: true)
            
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = .systemRed
        deleteAction.image = UIImage(systemName: "trash")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + restaurant.name
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: restaurant.image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        shareAction.backgroundColor = .systemOrange
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let favoriteAction = UIContextualAction(style: .destructive, title: "") { (action, sourceView, completionHandler) in
                self.markCellAsFavorite(at: indexPath)
                completionHandler(true)
            }
        
            favoriteAction.backgroundColor = UIColor.systemYellow
            favoriteAction.image = UIImage(systemName: self.restaurants[indexPath.row].isVisited ? "heart.slash.fill" : "heart.fill")
            
            let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
                
            return swipeConfiguration
    }
    
    func markCellAsFavorite(at indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
        cell.favoriteImage.isHidden = self.restaurants[indexPath.row].isVisited
        self.restaurants[indexPath.row].isVisited = self.restaurants[indexPath.row].isVisited ? false : true
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailsViewController
                let restaurant = self.restaurants[indexPath.row]
                destinationController.restaurant = restaurant
            }
        }
    }
}
