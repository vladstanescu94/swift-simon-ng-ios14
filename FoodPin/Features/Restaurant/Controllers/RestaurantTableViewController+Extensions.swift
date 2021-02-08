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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setupOptionsMenu(indexPath: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: - Options Alert Menu
    
    private func setupOptionsMenu(indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        optionMenu.addAction(setupCancelAction())
        optionMenu.addAction(setupReserveAction())
        optionMenu.addAction(setupFavoriteAction(indexPath: indexPath))
        
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        present(optionMenu, animated: true, completion: nil)
    }
    
    private func setupCancelAction() -> UIAlertAction {
        return UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    }
    
    private func setupReserveAction() -> UIAlertAction {
        let reserveActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet. Please retry later", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        return UIAlertAction(title: "Reserve a table", style: .default, handler: reserveActionHandler)
    }
    
    private func setupFavoriteAction(indexPath: IndexPath) -> UIAlertAction {
        let favoriteActionTitle = self.restaurants[indexPath.row].isVisited ? "Remove from favorites" : "Mark as favorite"
        
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            self.markCellAsFavorite(at: indexPath)
        })
        
        return favoriteAction
    }
    
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
}
