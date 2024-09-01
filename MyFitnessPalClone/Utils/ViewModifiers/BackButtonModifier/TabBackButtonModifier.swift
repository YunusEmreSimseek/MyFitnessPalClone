//
//  TabBackButtonModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct TabBackButtonModifier: ViewModifier {
    @Binding var selection: Int
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    TabBackButton(selection: $selection)
                }
            }
    }
}
