//
//  DimSumDetailController.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit
import Cosmos

class DimSumDetailController: UIViewController {

    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var chineseLabel: UILabel!
    @IBOutlet weak var dimSumImage: UIImageView!
    @IBOutlet weak var dimSumDescriptionTextView: UITextView!
    @IBOutlet weak var dimSumRating: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func favoriteDimSum(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func playCantonese(_ sender: UIButton) {
        
    }
    
    @IBAction func openReviewsScreen(_ sender: UIButton) {
        
    }
}
