//
//  FoodViewModel.swift
//  Xeta-Assignment
//
//  Created by Shreyas Sahoo on 18/07/24.
//

import Foundation

class FoodViewModel: ObservableObject {
    @Published var data: FoodDataModel?
    @Published var error: Error?

    func loadData() {
        Task {
                    do {
                        guard let url = URL(string: "http://52.25.229.242:8000/food_info/") else { return }
                        let data = try await NetworkManager.shared.fetchJSON(from: url, as: FoodDataModel.self)
                        print(data.data.nutritionInfo)
                        DispatchQueue.main.async {
                            self.data = data
                        }
                    } catch {
                        DispatchQueue.main.async {
                            self.error = error
                        }
                    }
                }
            }
    }

