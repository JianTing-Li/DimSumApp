//
//  DimSumController.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class DimSumController: UIViewController {
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var allDimSums = DimSum.getAllDimSums()
    var allReviews = [DimSumReview]() {
        didSet {
            foodCollectionView.reloadData()
        }
        // comment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "FoodCell", bundle: nil)
        foodCollectionView.register(nib, forCellWithReuseIdentifier: "FoodCell")
        foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
        title = "Dim Sums"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        allReviews = DimSumReviewsManager.fetchAllReviews()
    }

}

extension DimSumController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 800/2, height: 500/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dimSum = allDimSums[indexPath.row]
        let dimSumDetailStoryboard = UIStoryboard.init(name: "DimSumDetail", bundle: nil)
        let destinationVC = dimSumDetailStoryboard.instantiateViewController(withIdentifier: "DimSumDetailVC") as! DimSumDetailController
        destinationVC.dimSum = dimSum
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension DimSumController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as? FoodCollectionViewCell else {
            return UICollectionViewCell()
        }
        let selectedDimSum = allDimSums[indexPath.row]
        foodCell.layer.cornerRadius = 3
        foodCell.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        foodCell.layer.borderWidth = 5
        foodCell.configureCell(selectedDimSum: selectedDimSum, allReviews: allReviews)
        return foodCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allDimSums.count
    }
}
