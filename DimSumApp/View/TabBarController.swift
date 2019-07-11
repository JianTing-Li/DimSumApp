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
        let blueStoryboard = UIStoryboard(name: "Blue", bundle: nil)
        let blueController = blueStoryboard.instantiateViewController(withIdentifier: "blueController") as! RestaurantController
        viewControllers = [blueController]
    }

}
