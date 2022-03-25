//
//  Spring_CleaningApp.swift
//  Spring Cleaning
//
//  Created by Admin on 3/10/22.
//

import SwiftUI
import Firebase

@main
struct Spring_CleaningApp: App {
    
    @StateObject var sessionService = SessionServiceImplementation()
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView {
                
                switch sessionService.state {
                case .loggedIn:
//                    HomeView()
                    AppTabNavigation()
                        .environmentObject(sessionService)
                case .loggedOut:
                        LoginView()
                }
                LoginView()
            }
        }
    }
}

 
