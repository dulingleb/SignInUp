//
//  UserModel.swift
//  SignInUp
//
//  Created by Dulin Gleb on 28.8.23..
//

import Foundation

struct UserModel: Codable {
    let name: String?
    let email: String
    let password: String
}
