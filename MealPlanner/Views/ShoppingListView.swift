//
//  ShoppingListView.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import SwiftUI

struct ShoppingListView: View {
    @StateObject private var viewModel = ShoppingListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.shoppingList) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Button(action: {
                        viewModel.toggleItemCompletion(item: item)
                    }) {
                        Image(systemName: item.completed ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.completed ? .green : .gray)
                    }
                }
            }
            .navigationTitle("Shopping List")
            .navigationBarItems(trailing: Button("Clear List") {
                viewModel.clearList()
            })
            .onAppear {
                viewModel.loadShoppingList()
            }
        }
    }
}

