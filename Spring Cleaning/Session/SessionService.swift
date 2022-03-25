//
//  SessionService.swift
//  Spring Cleaning
//
//  Created by Admin on 3/20/22.
//

import Combine
import Foundation
import FirebaseAuth
import FirebaseDatabase


enum SessionState {
    case loggedIn, loggedOut
}

protocol SessionService {
    var state: SessionState { get }
    var userDetails: SessionUserDetails? { get }
    func logOut()
}

final class SessionServiceImplementation: ObservableObject, SessionService {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        setUpFireAuthHandler()
    }
    
    func logOut() {
        try? Auth.auth().signOut()
    }
    
}

private extension SessionServiceImplementation {
    
    func setUpFireAuthHandler() {
        handler = Auth.auth().addStateDidChangeListener{ [weak self] res, user in
            
            guard let self = self else { return }
            self.state = user == nil ? .loggedOut: .loggedIn
            if let uid = user?.uid {
                self.handleRefresh(with: uid)
            }
        }
    }
    
    func handleRefresh(with uid: String) {
        
        Database.database().reference()
            .child("users").child(uid)
            .observe(.value) { [weak self] snapshot in
                guard let self = self,
                      let value = snapshot.value as? NSDictionary,
                      let firstName = value[RegistrationFields.firstName.rawValue] as? String,
                      let lastName = value[RegistrationFields.lastName.rawValue] as? String,
                      let occupation = value[RegistrationFields.occupation.rawValue] as? String else {
                          return
                      }
                      
                DispatchQueue.main.async {
                    self.userDetails = SessionUserDetails(firstName: firstName, lastName: lastName, occupation: occupation)
                }
            }
    }
}
