//
//  Restaurant.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 05.02.2021.
//

struct Restaurant: Hashable {
    var name: String
    var image: String
    var location: String
    var type: String
    var isVisited: Bool = false
}

extension Restaurant {
    static var mockedData: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend", location: "Hong Kong", type: "Coffee & Tea Shop"),
        Restaurant(name: "Homei", image: "homei", location: "Hong Kong", type: "Cafe"),
        Restaurant(name: "Teakha", image: "teakha", location: "Hong Kong", type: "Tea House"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl", location: "Hong Kong", type: "Austrian / Causual Drink"),
        Restaurant(name: "Petite Oyster", image: "petiteoyster", location: "Hong Kong", type: "French"),
        Restaurant(name: "For Kee Restaurant", image: "forkee", location: "Hong Kong", type: "Bakery"),
        Restaurant(name: "Po's Atelier", image: "posatelier", location: "Hong Kong", type: "Bakery"),
        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery", location: "Sydney", type: "Bakery"),
        Restaurant(name: "Haigh's Chocolate", image: "haigh", location: "Sydney", type: "Chocolate"),
        Restaurant(name: "Palomino Espresso", image: "palomino", location: "Sydney", type: "Cafe"),
        Restaurant(name: "Upstate", image: "upstate", location: "New York", type: "American / Seafood"),
        Restaurant(name: "Traif", image: "traif", location: "New York", type: "American"),
        Restaurant(name: "Graham Avenue Meats", image: "graham", location: "New York", type: "American"),
        Restaurant(name: "Waffle & Wolf", image: "waffleandwolf", location: "New York", type: "Breakfast & Brunch"),
        Restaurant(name: "Five Leaves", image: "fiveleaves", location: "New York", type: "Coffee & Tea"),
        Restaurant(name: "Cafe Lore", image: "cafelore", location: "New York", type: "Coffee & Tea"),
        Restaurant(name: "Confessional", image: "confessional", location: "New York", type: "Latin American"),
        Restaurant(name: "Barrafina", image: "barrafina", location: "London", type: "Spanish"),
        Restaurant(name: "Donostia", image: "donostia", location: "London", type: "Spanish"),
        Restaurant(name: "Royal Oak", image: "royaloak", location: "London", type: "British"),
        Restaurant(name: "CASK Pub and Kitchen", image: "cask", location: "London", type: "Thai")
    ]
}
