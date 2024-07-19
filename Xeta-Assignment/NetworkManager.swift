//
//  NetworkManager.swift
//  Xeta-Assignment
//
//  Created by Shreyas Sahoo on 18/07/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
    
    func fetchJSON<T: Decodable>(from url: URL, as type: T.Type) async throws -> T {
        let data = try await fetchData(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
