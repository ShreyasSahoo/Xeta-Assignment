//
//  HomeViewModel.swift
//  Xeta-Assignment
//
//  Created by Shreyas Sahoo on 18/07/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var data: HomeDataModel?
    @Published var error: Error?
    
    func loadData() {
        Task {
            do {
                let url = URL(string: "http://52.25.229.242:8000/homepage_v2/")!
                let data = try await NetworkManager.shared.fetchJSON(from: url, as: HomeDataModel.self)
                DispatchQueue.main.async {
                    self.data = data
                }
                print(data)
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }
    }
}
