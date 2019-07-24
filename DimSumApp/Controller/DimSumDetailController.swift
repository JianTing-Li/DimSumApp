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
    
    public var dimSum: DimSum!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureUI() {
        engLabel.text = dimSum.foodEng
        chineseLabel.text = dimSum.foodChi
        dimSumImage.image = UIImage.init(named: dimSum.foodEng.components(separatedBy: " ").joined() + "0")
        dimSumDescriptionTextView.text = dimSum.foodDescription
        setRating()
    }
    
    private func setRating() {
        
    }
    
    @IBAction func favoriteDimSum(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func playCantonese(_ sender: UIButton) {
        
    }
    
    @IBAction func openReviewsScreen(_ sender: UIButton) {
        
    }
}
