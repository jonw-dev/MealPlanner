//
//  AddMealView.swift
//  MealPlanner
//
//  Created by jon richardson-williams on 09/11/2024.
//

import SwiftUI

struct AddMealView: View {
    @ObservedObject var viewModel: MealListViewModel
    @State private var name = ""
    @State private var description = ""
    @State private var image: UIImage? = nil
    @State private var items: [Item] = []
    @State private var showingImagePicker = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Meal Name")) {
                    TextField("Enter meal name", text: $name)
                }

                Section(header: Text("Description")) {
                    TextField("Enter meal description", text: $description)
                }

                Section(header: Text("Meal Image")) {
                    Button("Select Image") {
                        showingImagePicker = true
                    }
                    if let mealImage = image {
                        Image(uiImage: mealImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }

                Section(header: Text("Items")) {
                    Button("Add Items") {
                        // Implement item selection logic
                    }
                }

                Section {
                    Button("Save Meal") {
                        if let selectedImage = image, !name.isEmpty, !description.isEmpty {
                            let mealImageData = selectedImage.jpegData(compressionQuality: 1.0) ?? Data()
                            viewModel.addMeal(name: name, description: description, image: mealImageData, items: items)
                        }
                    }
                }
            }
            .navigationTitle("Add New Meal")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: $image)
            }
        }
    }
}

