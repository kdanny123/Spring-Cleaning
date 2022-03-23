//
//  RegistrationViewModel.swift
//  Spring Cleaning
//
//  Created by Admin on 3/17/22.
//

import Foundation
import Combine

enum RegistrationState {
    case successful
    case failed(error: Error)
    case invalid
}

protocol RegistrationViewModel {
    func register()
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationDetails { get }
    init(service: RegistrationService)
}

final class RegistrationViewModelImplentation: ObservableObject, RegistrationViewModel {
    let service: RegistrationService
    var state: RegistrationState = .invalid
    var userDetails: RegistrationDetails = RegistrationDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
    }
    
    func register() {
        
        service.register(with: userDetails).sink { [weak self] res in
            switch res {
            case .failure(let error):
                self?.state = .failed(error: error)
            default:
                break
            }
        } receiveValue: { [weak self] in
            self?.state = .successful
        }
        .store(in: &subscriptions)

        
        
        
    }
    
    
}
