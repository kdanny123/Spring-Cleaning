//
//  AppTabNavigation.swift
//  Spring Cleaning
//
//  Created by Admin on 3/23/22.
//

import SwiftUI

struct AppTabNavigation: View {
    

    
    enum Tab {
        case search
        case favorites
        case home
        case sell
    }
    
    @State private var selection: Tab = .home
    
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                SearchView()
            }
            .tabItem {
                let menuText = Text("Search", comment: "search window tab title")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "list.bullet")
                }.accessibility(label: menuText)
            }
            .tag(Tab.search)
            
            NavigationView {
                Favorites()
            }
            .tabItem {
                Label {
                    Text("Favorites",
                         comment: "Favorites tab title")
                } icon: {
                    Image(systemName: "heart.fill")
                }
            }
            .tag(Tab.favorites)
            
            
            
            
            NavigationView {
                HomeView()

            }
            .tabItem {
                Label {
                    Text("Account",
                         comment: "home tab title")
                } icon: {
                    Image(systemName: "seal.fill")
                }
            }
            .tag(Tab.home)
            
            
            
            
            NavigationView {
                SellView()
            }
            .tabItem {
                Label {
                    Text("Sell",
                         comment: "Sell tab title")
                } icon: {
                    Image(systemName: "book.closed.fill")
                }
            }
            .tag(Tab.sell)
        }
        
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
