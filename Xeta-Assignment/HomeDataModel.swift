//
//  HomeDataModel.swift
//  Xeta-Assignment
//
//  Created by Shreyas Sahoo on 18/07/24.
//

import Foundation


struct HomeDataModel: Decodable {
    let success: Bool
    let data: DataModel
    let message: String
}

struct DataModel: Decodable {
    let section1: Section1
    let section2: Section2
    let section3: Section3
    let section4: Section4

    enum CodingKeys: String, CodingKey {
        case section1 = "section_1"
        case section2 = "section_2"
        case section3 = "section_3"
        case section4 = "section_4"
    }
}

struct Section1: Decodable {
    let planName: String
    let progress: String

    enum CodingKeys: String, CodingKey {
        case planName = "plan_name"
        case progress
    }
}

struct Section2: Decodable {
    let accuracy: String
    let workoutDuration: String
    let reps: Int
    let caloriesBurned: Int

    enum CodingKeys: String, CodingKey {
        case accuracy
        case workoutDuration = "workout_duration"
        case reps
        case caloriesBurned = "calories_burned"
    }
}

struct Section3: Decodable {
    let plan1: Plan
    let plan2: Plan

    enum CodingKeys: String, CodingKey {
        case plan1 = "plan_1"
        case plan2 = "plan_2"
    }
}

struct Plan: Decodable {
    let planName: String
    let difficulty: String

    enum CodingKeys: String, CodingKey {
        case planName = "plan_name"
        case difficulty
    }
}

struct Section4: Decodable {
    let category1: Category
    let category2: Category

    enum CodingKeys: String, CodingKey {
        case category1 = "category_1"
        case category2 = "category_2"
    }
}

struct Category: Decodable {
    let categoryName: String
    let numberOfExercises: String

    enum CodingKeys: String, CodingKey {
        case categoryName = "category_name"
        case numberOfExercises = "no_of_exercises"
    }
}
