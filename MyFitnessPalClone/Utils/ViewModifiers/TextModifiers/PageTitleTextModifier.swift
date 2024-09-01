//
//  PageTitleModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 20.08.2024.
//

import SwiftUI

struct PageTitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.bold)
    }
}

extension View {
    /// Font: Title3, Weight: Bold
    func pageTitleText() -> some View {
        modifier(PageTitleTextModifier())
    }
}
