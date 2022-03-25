//
//  ForgotPasswordService.swift
//  Spring Cleaning
//
//  Created by Admin on 3/21/22.
//

import Foundation
import Combine
import FirebaseAuth

protocol ForgotPasswordService {
    func sendPasswordReset(to email: String) -> AnyPublisher<Void, Error>
    
    
}

final class ForgotPasswordServiceImplementation: ForgotPasswordService {
    func sendPasswordReset(to email: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                
                Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
