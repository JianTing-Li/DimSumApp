//
//  DimSum.swift
//  DimSumApp
//
//  Created by Jabeen's MacBook on 7/20/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

public enum DimSumCategory: String {
    case cake
    case dumplings
    case sweets
    case noodleRolls = "Noodle Rolls"
    case other
}

struct DimSum {
    let foodEng: String
    let foodChi: String
    let category: DimSumCategory
    let foodDescription: String
    let dessert: Bool
    let vegetarian: Bool
    
    init(foodEng: String, foodChi: String, category: DimSumCategory, foodDescription: String, dessert: Bool, vegetarian: Bool) {
        self.foodEng = foodEng
        self.foodChi = foodChi
        self.category = category
        self.foodDescription = foodDescription
        self.dessert = dessert
        self.vegetarian = vegetarian
    }
    
    public func getAllDimSums() -> [DimSum] {
        return [
            DimSum(foodEng: "Turnip Cake", foodChi: "萝卜糕", category: DimSumCategory.cake, foodDescription: "Grated turnip with dried shrimp and Chinese sausage.", dessert: false, vegetarian: false),
            DimSum(foodEng: "Shrimp Noodle Rolls", foodChi: "虾肠", category:  DimSumCategory.noodleRolls, foodDescription: "Shrimp wrapped in a rice noodle sheet with soy sauce.", dessert: false, vegetarian: false),
            DimSum(foodEng: "Beef Noodle Rolls", foodChi: "牛肠", category: DimSumCategory.noodleRolls, foodDescription: "Minced beef wrapped in a rice noodle sheet with soy sauce.", dessert: false, vegetarian: false),
            DimSum(foodEng: "Sweet Tofu", foodChi: "豆腐花", category: DimSumCategory.sweets, foodDescription: "Silky tofu in a sweet syrup made from ginger and rock sugar.", dessert: true, vegetarian: true),
            DimSum(foodEng: "Fried Sesame Balls", foodChi: "煎堆", category: DimSumCategory.sweets, foodDescription: "Fried dough covered with sesame seeds and filled with a sweet red bean paste.", dessert: true, vegetarian: true),
            DimSum(foodEng: "Lotus-Wrapped Sticky Rice", foodChi: "糯米鸡", category: DimSumCategory.other, foodDescription: "Pork, chicken, sausage and mushrooms wrapped in a lotus leaf.", dessert: false, vegetarian: false)
        ]
    }
}
