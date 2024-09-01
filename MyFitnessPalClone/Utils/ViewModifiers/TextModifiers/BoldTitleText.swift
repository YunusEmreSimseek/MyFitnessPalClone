//
//  BoldTitleText.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 22.08.2024.
//

import SwiftUI

struct BoldTitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .fontWeight(.bold)
    }
}

extension View {
    /// Font: Body, Weight: Bold
    func boldTitleText() -> some View {
        modifier(BoldTitleText())
    }
}
