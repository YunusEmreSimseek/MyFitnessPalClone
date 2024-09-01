//
//  BoldCaptionTextModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 20.08.2024.
//

import SwiftUI

struct BoldCaptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .fontWeight(.bold)
    }
}

extension View {
    /// Font: Footnote, Weight: Bold
    func boldCaptionText() -> some View {
        modifier(BoldCaptionTextModifier())
    }
}
