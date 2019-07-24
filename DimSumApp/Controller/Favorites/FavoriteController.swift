//
//  FavoriteController.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class FavoriteController: UIViewController {

    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    private var allDimSums = [DimSum]() {
        didSet {
            foodCollectionView.reloadData()
        }
    }
    private var allReviews = [DimSumReview]()
    private var favoritesDic = [String:Bool]() {
        didSet {
            allReviews = DimSumReviewsManager.fetchAllReviews()
            allDimSums = DimSum.getAllDimSums().filter { favoritesDic[$0.foodEng] != nil }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "FoodCell", bundle: nil)
        foodCollectionView.register(nib, forCellWithReuseIdentifier: "FoodCell")
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favoritesDic = UserDefaults.standard.object(forKey: UserDefaultsKeys.dimSumFavorites) as? [String : Bool] ?? [String : Bool]()
    }
}

extension FavoriteController: UICollectionViewDelegateFlowLayout {
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

extension FavoriteController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allDimSums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as? FoodCollectionViewCell else {
            return UICollectionViewCell()
        }
        let selectedDimSum = allDimSums[indexPath.row]
        foodCell.configureCell(selectedDimSum: selectedDimSum, allReviews: allReviews)
        return foodCell
    }
}
