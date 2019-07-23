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
    
    let testData = ["Dim Sum 1", "Dim Sum 2", "Dim Sum 3"]
    
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
        foodCell.chineseFoodLabel.text = testData[indexPath.row]
    return foodCell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
}
