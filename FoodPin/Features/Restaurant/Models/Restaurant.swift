//
//  Restaurant.swift
//  FoodPin
//
//  Created by Vlad Stanescu on 05.02.2021.
//

struct Restaurant: Hashable {
    var name: String = ""
    var image: String = ""
    var location: String = ""
    var type: String = ""
    var isFavorite: Bool = false
    var phone: String = ""
    var description: String = ""
}

extension Restaurant {
    static var mockedData: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend", location: "Hong Kong", type: "Coffee & Tea Shop", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Homei", image: "homei", location: "Hong Kong", type: "Cafe", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Teakha", image: "teakha", location: "Hong Kong", type: "Tea House"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl", location: "Hong Kong", type: "Austrian / Causual Drink", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Petite Oyster", image: "petiteoyster", location: "Hong Kong", type: "French", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "For Kee Restaurant", image: "forkee", location: "Hong Kong", type: "Bakery", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Po's Atelier", image: "posatelier", location: "Hong Kong", type: "Bakery", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery", location: "Sydney", type: "Bakery", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Haigh's Chocolate", image: "haigh", location: "Sydney", type: "Chocolate", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Palomino Espresso", image: "palomino", location: "Sydney", type: "Cafe", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Upstate", image: "upstate", location: "New York", type: "American / Seafood", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Traif", image: "traif", location: "New York", type: "American", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Graham Avenue Meats", image: "graham", location: "New York", type: "American", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Waffle & Wolf", image: "waffleandwolf", location: "New York", type: "Breakfast & Brunch", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Five Leaves", image: "fiveleaves", location: "New York", type: "Coffee & Tea", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Cafe Lore", image: "cafelore", location: "New York", type: "Coffee & Tea", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Confessional", image: "confessional", location: "New York", type: "Latin American", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Barrafina", image: "barrafina", location: "London", type: "Spanish", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Donostia", image: "donostia", location: "London", type: "Spanish", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "Royal Oak", image: "royaloak", location: "London", type: "British", phone: "0300300300", description: "Lorem ipsum"),
        Restaurant(name: "CASK Pub and Kitchen", image: "cask", location: "London", type: "Thai", phone: "0300300300", description: "Lorem ipsum")
    ]
}
