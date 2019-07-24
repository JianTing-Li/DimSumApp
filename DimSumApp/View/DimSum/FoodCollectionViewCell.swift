//
//  FoodCollectionViewCell.swift
//  DimSumApp
//
//  Created by Jabeen's MacBook on 7/17/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var engFoodLabel: UILabel!
    @IBOutlet weak var chineseFoodLabel: UILabel!
    @IBOutlet weak var avgRatingLabel: UILabel!
    
    public func configureCell(selectedDimSum: DimSum, allReviews: [DimSumReview]) {
        engFoodLabel.text = selectedDimSum.foodEng
        chineseFoodLabel.text = selectedDimSum.foodChi
        let imageName = selectedDimSum.foodEng.components(separatedBy: .whitespaces).joined()
        foodImageView.image = UIImage(named: "\(imageName)0")
        let dimSumRatings = allReviews.filter { $0.dimSumFoodEng == selectedDimSum.foodEng }.map { $0.rating }
        if dimSumRatings.count > 0 {
            let averageRating = dimSumRatings.reduce(0,+) / Double(dimSumRatings.count)
            avgRatingLabel.text = "\(averageRating.rounded(toPlaces: 1))⭐️"
        } else {
            avgRatingLabel.text = "5.0⭐️"
        }
    }





}
