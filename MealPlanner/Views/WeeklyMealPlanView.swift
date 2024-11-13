//
//  WeeklyMealPlanView.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import SwiftUI

struct WeeklyMealPlanView: View {
    @StateObject private var viewModel = WeeklyMealPlanViewModel()
    @State private var selectedStartDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Start Date", selection: $selectedStartDate, displayedComponents: .date)
                    .padding()

                List(DayOfWeek.allCases, id: \.self) { day in
                    NavigationLink(destination: mealSelectionView(for: day)) {
                        HStack {
                            // If a meal is selected for the day, display its details
                            if let meal = viewModel.getMeals(for: day.rawValue) {
                                // Image of the meal
                                Image(uiImage: UIImage(data: meal.image) ?? UIImage())
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .padding(.trailing, 10)

                                // Title of the meal
                                VStack(alignment: .leading) {
                                    Text(meal.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text(meal.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            } else {
                                // Placeholder text when no meal is selected for the day
                                Text("Select Meal")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }

                Button("Generate Shopping List") {
                    generateShoppingList()
                }
                .padding()
            }
            .navigationTitle("Weekly Meal Plan")
            .onAppear {
                viewModel.loadMealPlans()
            }
        }
    }

    // Function to generate shopping list from selected meals
    private func generateShoppingList() {
        var shoppingList = [Item]()
        for meal in viewModel.selectedMeals.values {
            shoppingList.append(contentsOf: meal.items)
        }
        // Save the shopping list to UserDefaults or perform other actions
    }

    // Meal selection view for each day
    private func mealSelectionView(for day: DayOfWeek) -> some View {
        MealSelectionView(day: day, viewModel: viewModel)
    }
}

enum DayOfWeek: String, CaseIterable {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

