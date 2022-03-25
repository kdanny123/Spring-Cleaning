//
//  RegistrationService.swift
//  Spring Cleaning
//
//  Created by Admin on 3/16/22.
//

import Combine
import FirebaseAuth
import Foundation
import FirebaseDatabase

enum RegistrationFields: String {
    case firstName
    case lastName
    case occupation
}


protocol RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImplementation: RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            Future { promise in
                
                Auth.auth()
                
                    .createUser(withEmail: details.email, password: details.password) { result, error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            
                            if let uid = result?.user.uid {
                                let values = [RegistrationFields.firstName.rawValue: details.firstName,
                                              RegistrationFields.lastName.rawValue: details.lastName,
                                              RegistrationFields.occupation.rawValue: details.occupation] as [String: Any]
                                
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) {error, suc in
                                        if let error = error {
                                            promise(.failure(error))
                                        } else {
                                            promise(.success(())) //void type
                                                
                                        }
                                        
                                    }
                                
                                
                            } else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                        }
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

