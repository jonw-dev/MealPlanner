//
//  Item.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var emoji: String?
    var completed: Bool = false

    init(name: String, emoji: String, completed: Bool = false) {
        self.id = UUID()
        self.name = name
        self.emoji = emoji
        self.completed = completed
    }
}

