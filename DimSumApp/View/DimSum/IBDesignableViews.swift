//
//  IBDesignableViews.swift
//  DimSumApp
//
//  Created by Jabeen's MacBook on 7/24/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

@IBDesignable
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        contentMode = .scaleAspectFill
        layer.cornerRadius = bounds.width / 2.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        clipsToBounds = true
    }
}

@IBDesignable
class CornerImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        contentMode = .scaleAspectFill
        layer.cornerRadius = 12.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        clipsToBounds = true
    }
}
