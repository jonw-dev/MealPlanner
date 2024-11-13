//
//  ItemsView.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import SwiftUI

struct ItemsView: View {
    @StateObject private var viewModel = ItemsViewModel()
    @State private var showingAddItemView = false
    @State private var newItemName = ""
    @State private var newItemEmoji = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for items", text: $viewModel.searchQuery)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                List(viewModel.searchItems()) { item in
                    HStack {
                        Text(item.emoji ?? "🛒")
                        Text(item.name)
                        Spacer()
                        if item.completed {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .navigationTitle("Items")
                .navigationBarItems(trailing: Button("Add Item") {
                    showingAddItemView.toggle()
                })
                .sheet(isPresented: $showingAddItemView) {
                    AddItemView(viewModel: viewModel)
                }
            }
        }
    }
}

