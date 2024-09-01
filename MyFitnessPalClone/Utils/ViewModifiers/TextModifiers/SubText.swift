//
//  SubText.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 22.08.2024.
//

import SwiftUI

struct SubText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
    }
}

extension View {
    /// Font: Footnote, Weight: Regular
    func subText() -> some View {
        modifier(SubText())
    }
}
