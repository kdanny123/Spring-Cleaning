//
//  ForgotPasswordView.swift
//  Spring Cleaning
//
//  Created by Admin on 3/16/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = ForgotPasswordViewModelImplementation(service: ForgotPasswordServiceImplementation())
    var body: some View {
        
        NavigationView {
            VStack(spacing: 16) {
                
                InputTextFieldView(text: $vm.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                
                ButtonView(title: "Send login link") {
                    vm.sendPasswordReset()
                    presentationMode.wrappedValue.dismiss()
                }
                
            }
            .padding(.horizontal, 15)
            .navigationTitle("Reset Password")
            .applyClose()
            
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
