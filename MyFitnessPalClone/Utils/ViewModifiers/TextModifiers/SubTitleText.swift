//
//  SubTitleText.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 22.08.2024.
//

import SwiftUI

struct SubTitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
    }
}

extension View {
    /// Font: Subheadline, Weight: Regular
    func subTitleText() -> some View {
        modifier(SubTitleText())
    }
}
