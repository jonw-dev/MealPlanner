//
//  MealPlannerApp.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import SwiftUI

@main
struct MealPlannerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                WeeklyMealPlanView()
                    .tabItem {
                        Label("Meal Plan", systemImage: "menucard")
                    }
                MealListView()
                    .tabItem {
                        Label("Meals", systemImage: "list.bullet")
                    }
                ShoppingListView()
                    .tabItem {
                        Label("Shopping List", systemImage: "checkmark")
                    }
                ItemsView()
                    .tabItem {
                        Label("Items", systemImage: "list.bullet")
                    }
            }
        }
    }
}


