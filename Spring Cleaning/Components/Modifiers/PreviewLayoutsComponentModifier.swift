//
//  PreviewLayoutsComponentModifier.swift
//  Spring Cleaning
//
//  Created by Admin on 3/15/22.
//

import SwiftUI

struct PreviewLayoutComponentModifier: ViewModifier {
    
    let name: String
    func body(content: Content) -> some View {
        
        content
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Text input with sfSymbols")
            .padding()
    }
}


extension View {
    func preview(with name: String) -> some View {
        self.modifier(PreviewLayoutComponentModifier(name: name))
    }
}
