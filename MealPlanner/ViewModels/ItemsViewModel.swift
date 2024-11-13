//
//  ItemsViewModel.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import Foundation

class ItemsViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var searchQuery: String = ""

    init() {
        loadItems()
    }

    func addItem(name: String, emoji: String?) {
        let newItem = Item(name: name, emoji: emoji ?? "🛒")  // Default to "🛒" if emoji is nil
        items.append(newItem)
        saveItems()
    }

    func searchItems() -> [Item] {
        if searchQuery.isEmpty {
            return items
        } else {
            return items.filter { $0.name.lowercased().contains(searchQuery.lowercased()) }
        }
    }

    func saveItems() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: "items")
        }
    }

    func loadItems() {
        if let savedData = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            if let loadedItems = try? decoder.decode([Item].self, from: savedData) {
                items = loadedItems
            }
        }
    }
}

