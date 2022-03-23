//
//  Homeview.swift
//  Spring Cleaning
//
//  Created by Admin on 3/16/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionService: SessionServiceImplementation
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 16) {
                Text("First Name: \(sessionService.userDetails?.firstName ?? "error")")
                Text("Last Name: \(sessionService.userDetails?.lastName ?? "error")")
                Text("Occupation: \(sessionService.userDetails?.occupation ?? "error")")
                     }
                     
                     ButtonView(title: "Logout") {
                         sessionService.logOut()
                }
                     
                     }
                        .padding(.horizontal, 16)
                        .navigationTitle("Main Content")
                     
                     
                     
                     
                     }
                     }
                     
                     struct Homeview_Previews: PreviewProvider {
                    static var previews: some View {
                        NavigationView {
                            HomeView()
                                .environmentObject(SessionServiceImplementation())
                        }
                    }
                }
