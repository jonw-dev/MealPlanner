//
//  Meal.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import Foundation

struct Meal: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var image: Data
    var items: [Item]

    init(name: String, description: String, image: Data, items: [Item]) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.image = image
        self.items = items
        print(name)
        
        print(name)
    }
}

