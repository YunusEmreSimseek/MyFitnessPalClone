//
//  BlueBackgroundModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 20.08.2024.
//

import SwiftUI

struct BlueBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.cBlue)
    }
}

extension View {
    func blueBackground() -> some View {
        modifier(BlueBackgroundModifier())
    }
}
