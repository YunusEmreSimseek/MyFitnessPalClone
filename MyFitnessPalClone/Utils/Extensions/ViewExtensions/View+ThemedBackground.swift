//
//  View+ThemedBackground.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 20.08.2024.
//

import SwiftUI

extension View {
    func themedBackground() -> some View {
        modifier(ThemedBackgroundModifier())
    }
}
