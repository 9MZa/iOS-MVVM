//
//  UserViewModel.swift
//  MVVM-iOS
//
//  Created by Bandit Silachai on 23/10/23.
//

import Foundation

class UserViewModel {
    
    var user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    var name: String {
        user.name
    }
    
    var email: String {
        user.email
    }
}
