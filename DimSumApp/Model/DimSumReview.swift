//
//  DimSumReview.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//


import Foundation

struct DimSumReview {
    let dimSumID: String
    let userID: String
    let rating: Double
    let description: String
    let location: String?
    
    init(dimSumID: String, userID: String, rating: Double, description: String, location: String ) {
        self.dimSumID = dimSumID
        self.userID = userID
        self.rating = rating
        self.description = description
        self.location = location
    }
}
