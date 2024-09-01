//
//  LoadingModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct BottomLoadingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    LoadingView(style: .bottom)
                        .bottomPadding(.medium2)
                }
            }
    }
}
