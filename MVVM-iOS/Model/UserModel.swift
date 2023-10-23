//
//  UserModel.swift
//  MVVM-iOS
//
//  Created by Bandit Silachai on 23/10/23.
//

import Foundation

struct UserModel {
    var name: String
    var email: String
    var avatar: URL?
}

let users = [
    UserModel(name: "Alice Smith", email: "alicesmith@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=Alice+Smith")),
    UserModel(name: "Bob Johnson", email: "bobjohnson@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=Bob+Johnson")),
    UserModel(name: "Emily Davis", email: "emilydavis@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=Emily+Davis")),
    UserModel(name: "Michael Brown", email: "michaelbrown@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=Michael+Brown")),
    UserModel(name: "Olivia Wilson", email: "oliviawilson@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=Olivia+Wilson")),
    UserModel(name: "David Lee", email: "davidlee@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=David+Lee")),
    UserModel(name: "Sophia Miller", email: "sophiamiller@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=Sophia+Miller")),
    UserModel(name: "James Garcia", email: "jamesgarcia@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=James+Garcia")),
    UserModel(name: "Grace Martinez", email: "gracemartinez@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=Grace+Martinez")),
    UserModel(name: "William Anderson", email: "williamanderson@email.com", avatar: URL(string: "https://ui-avatars.com/api/?name=William+Anderson"))
]
