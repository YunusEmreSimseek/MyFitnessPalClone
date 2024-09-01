//
//  ButtonTextModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 20.08.2024.
//

import SwiftUI

struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.bold)
    }
}

extension View {
    /// Font: Subheadline, Weight: Bold
    func buttonTextModifier() -> some View {
        modifier(ButtonTextModifier())
    }
}
