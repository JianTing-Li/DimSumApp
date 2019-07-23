//
//  TabBarController.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let dimSumStoryboard = UIStoryboard(name: "DimSum", bundle: nil)
        let NavDimSumVC = dimSumStoryboard.instantiateViewController(withIdentifier: "DimSumNav") as! UINavigationController

        let favoriteStoryboard = UIStoryboard(name: "Favorite", bundle: nil)
        let NavDimSumFavoriteVC = favoriteStoryboard.instantiateViewController(withIdentifier: "FavoriteDimNav") as! UINavigationController

        NavDimSumVC.tabBarItem = UITabBarItem(title: "Dim Sum", image: UIImage(named: "dim_sum_icon"), tag: 0)
        NavDimSumFavoriteVC.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite_icon"), tag: 1)
        viewControllers = [NavDimSumVC, NavDimSumFavoriteVC]
    }
}
