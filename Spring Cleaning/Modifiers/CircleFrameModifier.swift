//
//  CircleFrameModifier.swift
//  Spring Cleaning
//
//  Created by Admin on 3/31/22.
//

import SwiftUI

struct CircleFrameModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 5))
            .shadow(radius: 2)
    }
}

extension View {
    
    func applyCircleFrame() -> some View {
        self.modifier(CircleFrameModifier())
    }
}
