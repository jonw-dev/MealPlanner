//
//  MealSelectionView.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import SwiftUI

struct MealSelectionView: View {
    var day: DayOfWeek
    @ObservedObject var viewModel: WeeklyMealPlanViewModel

    var body: some View {
        VStack {
            Text("Select a Meal for \(day.rawValue)")
                .font(.title)
                .padding()

            // Sample meal options (Replace with dynamic meal data from your database or model)
            List(mealOptions, id: \.name) { meal in
                Button(action: {
                    selectMeal(meal)
                }) {
                    HStack {
                        // Display meal image (here it's hardcoded, but it can be updated with dynamic images)
                        Image(uiImage: UIImage(data: meal.image) ?? UIImage())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text(meal.name)
                            .font(.headline)
                    }
                }
            }
        }
        .navigationTitle("Select Meal")
        .padding()
    }

    // Function to handle meal selection
    private func selectMeal(_ meal: Meal) {
        viewModel.setMeal(for: day.rawValue, meal: meal)
    }

    // Sample meal data (replace this with real data, fetching meals from a list or database)
    var mealOptions: [Meal] {
        return [
            Meal(name: "Spaghetti", description: "Delicious pasta with marinara sauce.", image: "spaghetti_image".data(using: .utf8) ?? Data(), items: []),
            Meal(name: "Salad", description: "Fresh garden salad with a vinaigrette dressing.", image: "salad_image".data(using: .utf8) ?? Data(), items: []),
            Meal(name: "Pizza", description: "Cheese pizza with pepperoni topping.", image: "pizza_image".data(using: .utf8) ?? Data(), items: [])
        ]
    }
}

struct MealSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        // Providing mock data for preview
        MealSelectionView(day: .Monday, viewModel: WeeklyMealPlanViewModel())
    }
}

