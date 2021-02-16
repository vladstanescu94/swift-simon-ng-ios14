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
        navigationItem.backButtonTitle = ""
        
        if let appearance = navigationController?.navigationBar.standardAppearance {
            appearance.configureWithTransparentBackground()
            
            if let customFont = UIFont(name: "Nunito-Bold", size: 45.0) {
                appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 218/255, green: 96/255, blue: 51/255, alpha: 1.0)]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 218/255, green: 96/255, blue: 51/255, alpha: 1.0), .font: customFont]
            }
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}
