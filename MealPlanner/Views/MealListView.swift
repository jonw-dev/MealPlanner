//
//  MealListView.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealListViewModel()
    @State private var showingAddMealView = false

    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                VStack(alignment: .leading) {
                    Image(uiImage: UIImage(data: meal.image) ?? UIImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    Text(meal.name)
                    Text(meal.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Meals")
            .navigationBarItems(trailing: Button("Add Meal") {
                showingAddMealView = true
            })
            .sheet(isPresented: $showingAddMealView) {
                AddMealView(viewModel: viewModel)
            }
            .onAppear {
                viewModel.loadMeals()
            }
        }
    }
}


