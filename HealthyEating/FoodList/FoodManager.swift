//
//  FoodManager.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import Foundation

struct FoodManager {
    
}

struct Food {
    var name: String
    var imageName: String
    var price: Double
    var quantity: Int
    
    init(name: String, imageName: String, price: Double, quantity: Int) {
        self.name = name
        self.imageName = imageName
        self.price = price
        self.quantity = 0
    }
 }

struct FoodCategory {
    var categoryName: String
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
}
