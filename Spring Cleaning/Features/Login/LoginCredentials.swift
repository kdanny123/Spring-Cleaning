//
//  LoginCredentials.swift
//  Spring Cleaning
//
//  Created by Admin on 3/21/22.
//

import Foundation

struct LoginCredentials {
    var email, password: String
}


extension LoginCredentials {
    static var new: LoginCredentials {
        LoginCredentials(email: "", password: "")
    }
}
