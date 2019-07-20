//
//  DimSum.swift
//  DimSumApp
//
//  Created by Jabeen's MacBook on 7/20/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

struct DimSum {
    let foodEng: String
    let foodChi: String
    let foodPic: String
    let category: String
    let foodDescription: String
    let audioMale: String
    let audioFemale: String
    
    init(foodEng: String, foodChi: String, foodPic: String, category: String, foodDescription: String, audioMale: String, audioFemale: String) {
        self.foodEng = foodEng
        self.foodChi = foodChi
        self.foodPic = foodPic
        self.category = category
        self.foodDescription = foodDescription
        self.audioMale = audioMale
        self.audioFemale = audioFemale
    }
    
}
