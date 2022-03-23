//
//  RegistrationDetails.swift
//  Spring Cleaning
//
//  Created by Admin on 3/16/22.
//

import Foundation


struct RegistrationDetails {
    var email, password, firstName, lastName, occupation: String
    
}

extension RegistrationDetails {
    static var new: RegistrationDetails {
        RegistrationDetails(email: "", password: "", firstName: "", lastName: "", occupation: "")
    }
    
}
 
