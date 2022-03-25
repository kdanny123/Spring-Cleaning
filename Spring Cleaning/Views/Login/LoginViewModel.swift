//
//  LoginViewModel.swift
//  Spring Cleaning
//
//  Created by Admin on 3/21/22.
//

import Foundation
import Combine

enum LoginState {
    
    case sucessful
    case failed(error: Error)
    case invalid
}

protocol LoginViewModel {
    func login()
    var service: LoginService { get }
    var state: LoginState { get }
    var hasError: Bool { get }
    var credentials: LoginCredentials { get }
    init(service: LoginService)
}

final class LoginViewModelImplementation: ObservableObject, LoginViewModel {
    
    @Published var state: LoginState = .invalid
    @Published var hasError: Bool = false
    @Published var credentials: LoginCredentials = LoginCredentials.new
    
    private var subscriptions = Set<AnyCancellable>()
    let service: LoginService
    
    
    init(service: LoginService) {
        self.service = service
        setupErorrSubscriptions()
    }
    
    func login() {
        service
            .login(with: credentials)
            .sink { response in
                switch response {
                case .failure(let error):
                    self.state = .failed(error: error)
                default:
                    break
                }
            } receiveValue: { [weak self] in
                self?.state = .sucessful
            }
            .store(in: &subscriptions)
    }
}

private extension LoginViewModelImplementation {
    
    func setupErorrSubscriptions() {
         
        $state.map { state -> Bool in
            switch state {
            case .sucessful, .invalid:
                return false
            case .failed:
                return true
         
                
            }
        }
    }
}
