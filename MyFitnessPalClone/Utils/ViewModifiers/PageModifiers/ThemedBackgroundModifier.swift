//
//  ThemedBackgroundModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 20.08.2024.
//

import SwiftUI

struct ThemedBackgroundModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    func body(content: Content) -> some View {
        content
            .background(
                colorScheme == .dark ? .bGray : .white
            )
    }
}
