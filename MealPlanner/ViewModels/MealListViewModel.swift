//
//  MealListViewModel.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import Foundation

class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []

    // Add new meal
    func addMeal(name: String, description: String, image: Data, items: [Item]) {
        let newMeal = Meal(name: name, description: description, image: image, items: items)
        meals.append(newMeal)
        saveMeals()
    }

    // Save meals to UserDefaults
    func saveMeals() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(meals) {
            UserDefaults.standard.set(encoded, forKey: "meals")
        }
    }

    // Load meals from UserDefaults
    func loadMeals() {
        if let savedData = UserDefaults.standard.data(forKey: "meals") {
            let decoder = JSONDecoder()
            if let loadedMeals = try? decoder.decode([Meal].self, from: savedData) {
                meals = loadedMeals
            }
        }
    }
}

