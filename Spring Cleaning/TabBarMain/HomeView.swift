//
//  HomeView.swift
//  Spring Cleaning
//
//  Created by Admin on 3/23/22.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var session = SessionServiceImplementation()
    
    var body: some View {
        VStack {
            ProfileImage()
        }
        .navigationBarItems(trailing:
            Button(action: {
            }) {
                Image(systemName: "gear")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
        )
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
