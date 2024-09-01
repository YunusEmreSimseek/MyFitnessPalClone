//
//  TopTrailingLoadingModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct TopTrailingLoadingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    LoadingView(style: .topTrailing)
                }
            }
    }
}

extension View {
    /// Adds a loading view to the top trailing of the view.
    func topTrailingLoading() -> some View {
        self.modifier(TopTrailingLoadingModifier())
    }
}
