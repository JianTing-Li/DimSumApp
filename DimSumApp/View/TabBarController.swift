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
        let dimSumController = dimSumStoryboard.instantiateViewController(withIdentifier: "DimSumController") as! DimSumController
        viewControllers = [dimSumController]
    }
    
    // Hello
}
