//
//  RegisterView.swift
//  Spring Cleaning
//
//  Created by Admin on 3/16/22.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var vm = RegistrationViewModelImplentation(service: RegistrationServiceImplementation())
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                
                VStack(spacing: 16) {
                    InputTextFieldView(text: $vm.userDetails.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                    InputPasswordView(password: $vm.userDetails.password, placeholder: "Password", sfSymbol: "lock")
                    
                    Divider()
                    
                    InputTextFieldView(text: $vm.userDetails.firstName,
                                       placeholder: "First Name",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                    InputTextFieldView(text: $vm.userDetails.lastName,
                                       placeholder: "Last Name",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                    InputTextFieldView(text: $vm.userDetails.occupation,
                                       placeholder: "Occupation",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                   
                    
                }
                
                ButtonView(title: "Sign Up") {
                    vm.register()                }
                
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .applyClose()
           
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
