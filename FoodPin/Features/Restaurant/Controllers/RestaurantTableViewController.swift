//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 05.02.2021.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants = Restaurant.mockedData
    
    lazy var dataSource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupDataSourceSnapshot()
        setupNavigation()
    }
    
    private func setupTableView() {
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    
    private func setupDataSourceSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
