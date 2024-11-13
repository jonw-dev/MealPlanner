//
//  ShoppingListViewModel.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import Foundation

class ShoppingListViewModel: ObservableObject {
    @Published var shoppingList: [Item] = []

    func addItem(item: Item) {
        shoppingList.append(item)
        saveShoppingList()
    }

    func toggleItemCompletion(item: Item) {
        if let index = shoppingList.firstIndex(where: { $0.id == item.id }) {
            shoppingList[index].completed.toggle()
            saveShoppingList()
        }
    }

    func clearList() {
        shoppingList.removeAll()
        saveShoppingList()
    }

    func saveShoppingList() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(shoppingList) {
            UserDefaults.standard.set(encoded, forKey: "shoppingList")
        }
    }

    func loadShoppingList() {
        if let savedData = UserDefaults.standard.data(forKey: "shoppingList") {
            let decoder = JSONDecoder()
            if let loadedList = try? decoder.decode([Item].self, from: savedData) {
                shoppingList = loadedList
            }
        }
    }
}


