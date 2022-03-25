//
//  CloseModifier.swift
//  Spring Cleaning
//
//  Created by Admin on 3/16/22.
//

import SwiftUI

struct CloseModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        
        content
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                
            }
    }
}

extension View {
    
    func applyClose() -> some View {
        self.modifier(CloseModifier())
    }
}