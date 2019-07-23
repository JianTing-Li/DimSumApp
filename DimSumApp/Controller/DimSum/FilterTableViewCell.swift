//
//  FilterTableViewCell.swift
//  DimSumApp
//
//  Created by Jabeen's MacBook on 7/22/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    @IBOutlet weak var filterBoxButton: UIButton!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func buttonPressed(_ sender: UIButton) {
    }
    
    
    
    
}
