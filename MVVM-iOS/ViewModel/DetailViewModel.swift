//
//  DetailViewModel.swift
//  MVVM-iOS
//
//  Created by Bandit Silachai on 23/10/23.
//

import Foundation

class DetailViewModel {
    var name: String?
    var email: String?
    var avatar: URL?
    
    init(name: String? = nil, email: String? = nil, avatar: URL? = nil) {
        self.name = name
        self.email = email
        self.avatar = avatar
    }
}
