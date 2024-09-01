//
//  ButtonText.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 22.08.2024.
//

import SwiftUI

struct ButtonText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.bold)
    }
}

extension View {
    /// Font: SubHeadline, Weight: Bold
    func buttonText() -> some View {
        modifier(ButtonText())
    }
}
