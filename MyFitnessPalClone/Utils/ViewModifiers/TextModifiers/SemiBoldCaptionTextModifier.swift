//
//  SemoBoldCaptionTextModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 20.08.2024.
//

import SwiftUI

struct SemiBoldCaptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .fontWeight(.semibold)
    }
}

extension View {
    /// Font: Footnote, Weight: SemiBold
    func semiBoldCaptionText() -> some View {
        modifier(SemiBoldCaptionTextModifier())
    }
}
