//
//  BackButtonModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton()
                }
            }
    }
}

extension View {
    func backButtonModifier() -> some View {
        self.modifier(BackButtonModifier())
    }
}
