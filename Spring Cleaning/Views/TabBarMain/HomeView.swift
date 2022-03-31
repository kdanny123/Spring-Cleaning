//
//  HomeView.swift
//  Spring Cleaning
//
//  Created by Admin on 3/23/22.
//

import SwiftUI


struct HomeView: View {
    
    
    
    var body: some View {
        
        
        
        VStack {
            profileFrame
        }
        .navigationBarItems(trailing:
                                Button(action: {
            
            
        }) {
            NavigationLink(destination: Settings()) {
                Image(systemName: "gear")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
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
