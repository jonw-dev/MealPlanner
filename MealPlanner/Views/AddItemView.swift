//
//  AddItemView.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ItemsViewModel
    @State private var name = ""
    @State private var emoji = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Name")) {
                    TextField("Enter item name", text: $name)
                }

                Section(header: Text("Item Emoji")) {
                    TextField("Enter emoji", text: $emoji)
                }

                Section {
                    Button("Save Item") {
                        if !name.isEmpty {
                            viewModel.addItem(name: name, emoji: emoji)
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Add New Item")
        }
    }
}

