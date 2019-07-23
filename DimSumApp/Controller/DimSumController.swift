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
    @IBOutlet weak var serachBar: UISearchBar!
    
    var dimSum = DimSum.getAllDimSums()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "FoodCell", bundle: nil)
        foodCollectionView.register(nib, forCellWithReuseIdentifier: "FoodCell")
        foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
    }

}

extension DimSumController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 800/2, height: 500/2)
    }
}

extension DimSumController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as? FoodCollectionViewCell else {
            return UICollectionViewCell()
        }
        let selectedDimSum = dimSum[indexPath.row]
        foodCell.engFoodLabel.text = selectedDimSum.foodEng
        foodCell.chineseFoodLabel.text = selectedDimSum.foodChi
        let imageName = selectedDimSum.foodEng.components(separatedBy: .whitespaces).joined()
        print(imageName)
        foodCell.foodImageView.image = UIImage(named: "\(imageName)0")
        return foodCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dimSum.count
    }
}
