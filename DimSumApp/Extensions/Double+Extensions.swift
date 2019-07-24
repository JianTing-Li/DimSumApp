//
//  Double+Extensions.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/24/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
