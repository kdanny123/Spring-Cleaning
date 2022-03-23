//
//  ForgotPasswordViewModel.swift
//  Spring Cleaning
//
//  Created by Admin on 3/21/22.
//

import Foundation
import Combine


protocol ForgotPasswordViewModel {
    func sendPasswordReset()
    var service: ForgotPasswordService { get }
    var email: String { get }
    init(service: ForgotPasswordService)
}

final class ForgotPasswordViewModelImplementation: ObservableObject, ForgotPasswordViewModel {
    @Published var email: String = ""
    let service: ForgotPasswordService
    private var subscriptions = Set<AnyCancellable>()
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
    func sendPasswordReset() {
        service.sendPasswordReset(to: email).sink { response in
            switch response {
            case .failure(let error):
                print("\(error)")
            default:
                break
            }
        } receiveValue: {
            print("Instructions sent to email")
        }
        .store(in: &subscriptions)

    }
}
