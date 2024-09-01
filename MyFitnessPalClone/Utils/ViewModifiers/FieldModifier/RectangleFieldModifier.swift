//
//  RectangleFieldModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct RectangleFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(lineWidth: 0.75)
            }
    }
}

extension View {
    /// RoundedRectange with cornerRadius: 6 and stroke lineWidth: 0.75
    func rectangleFieldModifier() -> some View {
        self.modifier(RectangleFieldModifier())
    }
}
