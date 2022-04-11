//
//  LoginView.swift
//  Spring Cleaning
//
//  Created by Admin on 3/15/22.
//
import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject private var viewModel = LoginViewModelImplementation(
        service: LoginServiceImplementation()
    )
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            VStack(spacing: 16) {
                
                InputTextFieldView(text: $viewModel.credentials.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                InputPasswordView(password: $viewModel.credentials.password,
                                  placeholder: "Password",
                                  sfSymbol: "lock")
            }
            
            HStack {
                Spacer()
                Button(action: {
                    showForgotPassword.toggle()
                }, label: {
                    Text("Forgot Password?")
                })
                .font(.system(size: 16, weight: .bold))
                .sheet(isPresented: $showForgotPassword) {
                        ForgotPasswordView()
                }
            }
            
            VStack(spacing: 16) {
                
                ButtonView(title: "Login") {
                    viewModel.login()
                }
                
                ButtonView(title: "Register",
                           background: .clear,
                           foreground: .blue,
                           border: .blue) {
                    showRegistration.toggle()
                }
                .sheet(isPresented: $showRegistration) {
                        RegisterView()
                }
            }
        }
        .padding(.horizontal, 15)
        .navigationTitle("Login")
        .alert(isPresented: $viewModel.hasError,
               content: {

            if case .failed(let error) = viewModel.state {
                print("1 error")
                    return Alert(title: Text("Error"),message: Text(error.localizedDescription))
                
                } else {
                    print("2 error")
                    return Alert(
                        title: Text("Error"),
                        message: Text("Something went wrong"))
                    
                }
         })
    }
        
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}

    
