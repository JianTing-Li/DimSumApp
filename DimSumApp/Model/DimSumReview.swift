//
//  DimSumReview.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//


import Foundation

struct DimSumReview: Codable {
    let dimSumID: String?
    let userID: String?
    let rating: Double
    let description: String
    let location: String?
}
