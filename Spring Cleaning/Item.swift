//
//  Item.swift
//  Spring Cleaning
//
//  Created by Admin on 3/13/22.
//

import SwiftUI


struct Item: View {
    let screenwidth = UIScreen.main.bounds.width
    var body: some View {
        
        VStack {
        Image("jeans")
                .resizable()
                .scaledToFit()
        }
        .frame(width: screenwidth, height: screenwidth)
        .border(Color.black)
        
        
    }
    
}

struct Item_Previews: PreviewProvider {
    static var previews: some View {
        Item()
    }
}
