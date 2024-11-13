//
//  WeeklyMealPlan.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import Foundation

struct WeeklyMealPlan: Identifiable, Codable {
    var id: UUID
    var startDate: Date
    var meals: [String: Meal] // Dictionary of meals by day of the week

    init(startDate: Date, meals: [String: Meal]) {
        self.id = UUID()
        self.startDate = startDate
        self.meals = meals
    }

    static func save(plans: [WeeklyMealPlan]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(plans) {
            UserDefaults.standard.set(encoded, forKey: "weeklyMealPlans")
        }
    }

    static func load() -> [WeeklyMealPlan] {
        if let savedData = UserDefaults.standard.data(forKey: "weeklyMealPlans") {
            let decoder = JSONDecoder()
            if let loadedPlans = try? decoder.decode([WeeklyMealPlan].self, from: savedData) {
                return loadedPlans
            }
        }
        return []
    }
}

