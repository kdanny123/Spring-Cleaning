//
//  LoginService.swift
//  Spring Cleaning
//
//  Created by Admin on 3/21/22.
//

import Foundation
import Combine
import FirebaseAuth

protocol LoginService {
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void, Error>
}

final class LoginServiceImplementation: LoginService {
    
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void, Error> {
        
        Deferred {
            Future { promise in
                
                Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { response, error in
                    
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}
