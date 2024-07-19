//
//  FoodDataModel.swift
//  Xeta-Assignment
//
//  Created by Shreyas Sahoo on 18/07/24.
//

import Foundation

// MARK: - Response Model
struct FoodDataModel: Codable {
    let success: Bool
    let data: RecipeData
    let message: String
}

// MARK: - Recipe Data
struct RecipeData: Codable {
    let id: String
    let apiName: [String]
    let badgeIndicator: String
    let creditsURL: String
    let cuisine: String
    let description: String
    let genericFacts: [String]
    let healthRating: Double
    let image: String
    let imageURL: String
    let ingredients: [Ingredient]
    let itemtype: String
    let name: String
    let noOfServings: Double
    let nutritionFacts: String
    let nutritionInfo: [Nutrient]
    let nutritionInfoScaled: [NutritionInfo]
    let servingSizes: [ServingSize]
    let similarItems: [SimilarItem]
    let type: String
    let defaultUnitServing: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case apiName = "api_name"
        case badgeIndicator = "badge_indicator"
        case creditsURL = "credits_url"
        case cuisine
        case description
        case genericFacts = "generic_facts"
        case healthRating = "health_rating"
        case image
        case imageURL = "image_url"
        case ingredients
        case itemtype
        case name
        case noOfServings = "no_of_servings"
        case nutritionFacts = "nutrition_facts"
        case nutritionInfo = "nutrition_info"
        case nutritionInfoScaled = "nutrition_info_scaled"
        case servingSizes = "serving_sizes"
        case similarItems = "similar_items"
        case type
        case defaultUnitServing = "default_unit_serving"
    }
    
    init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           id = try container.decode(String.self, forKey: .id)
           apiName = try container.decode([String].self, forKey: .apiName)
           badgeIndicator = try container.decode(String.self, forKey: .badgeIndicator)
           creditsURL = try container.decode(String.self, forKey: .creditsURL)
           cuisine = try container.decode(String.self, forKey: .cuisine)
           description = try container.decode(String.self, forKey: .description)
           genericFacts = try container.decode([String].self, forKey: .genericFacts)
           healthRating = try container.decode(Double.self, forKey: .healthRating)
           image = try container.decode(String.self, forKey: .image)
           imageURL = try container.decode(String.self, forKey: .imageURL)
           ingredients = try container.decode([Ingredient].self, forKey: .ingredients)
           itemtype = try container.decode(String.self, forKey: .itemtype)
           name = try container.decode(String.self, forKey: .name)
           noOfServings = try container.decode(Double.self, forKey: .noOfServings)
           nutritionFacts = try container.decode(String.self, forKey: .nutritionFacts)
           nutritionInfoScaled = try container.decode([NutritionInfo].self, forKey: .nutritionInfoScaled)
           servingSizes = try container.decode([ServingSize].self, forKey: .servingSizes)
           similarItems = try container.decode([SimilarItem].self, forKey: .similarItems)
           type = try container.decode(String.self, forKey: .type)
           defaultUnitServing = try container.decode(String.self, forKey: .defaultUnitServing)

           
           let nutritionInfoString = try container.decode(String.self, forKey: .nutritionInfo)
           let validJSONString = nutritionInfoString.replacingOccurrences(of: "'", with: "\"")
           let nutritionInfoData = validJSONString.data(using: .utf8)!
           nutritionInfo = try JSONDecoder().decode([Nutrient].self, from: nutritionInfoData)
       }
    
    
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let ingid: String
    let name: String
    let value: Double
}

//MARK: - Nutrient
struct Nutrient: Codable, Hashable {
    let units: String
    let name: String
    let value: Double
}


// MARK: - Nutrition Info
struct NutritionInfo: Codable, Hashable {
    let name: String
    let value: Double
    let units: String
}

// MARK: - Serving Size
struct ServingSize: Codable {
    let units: String
    let name: String
    let value: Double
}

// MARK: - Similar Item
struct SimilarItem: Codable, Hashable {
    let id: String
    let name: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case image
    }
}
