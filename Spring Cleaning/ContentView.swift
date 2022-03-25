//
//  Homeview.swift
//  Spring Cleaning
//
//  Created by Admin on 3/16/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionServiceImplementation
    var body: some View {
        AppTabNavigation()
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .environmentObject(SessionServiceImplementation())
        
    }
}
