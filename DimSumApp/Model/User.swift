//
//  User.swift
//  DimSumApp
//
//  Created by Jabeen's MacBook on 7/20/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

struct User {
    let userEmailID: String
    let profilePic: String
    let name: String
    
    init(userEmailID: String, profilePic: String, name: String) {
        self.userEmailID = userEmailID
        self.profilePic = profilePic
        self.name = name
    }
}
