//
//  WeeklyMealPlanViewModel.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import Foundation

class WeeklyMealPlanViewModel: ObservableObject {
    @Published var weeklyMealPlans: [WeeklyMealPlan] = []
    @Published var selectedMeals: [String: Meal] = [:] // Meals selected for each day of the week

    func generateMealPlan(startDate: Date, selectedMeals: [String: Meal]) {
        let newPlan = WeeklyMealPlan(startDate: startDate, meals: selectedMeals)
        weeklyMealPlans.append(newPlan)
        WeeklyMealPlan.save(plans: weeklyMealPlans)
    }

    func loadMealPlans() {
        weeklyMealPlans = WeeklyMealPlan.load()
    }

    func getMeals(for day: String) -> Meal? {
        return selectedMeals[day]
    }

    func setMeal(for day: String, meal: Meal) {
        selectedMeals[day] = meal
        generateMealPlan(startDate: Date(), selectedMeals: selectedMeals) // Update the meal plan
    }
}

