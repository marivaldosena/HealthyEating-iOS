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
    
    init(name: String, imageName: String, price: Double) {
        self.name = name
        self.imageName = imageName
        self.price = price
    }
 }

struct FoodCategory {
    var categoryName: String
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
}
