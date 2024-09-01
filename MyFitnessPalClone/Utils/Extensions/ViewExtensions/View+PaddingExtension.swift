//
//  View+PaddingExtension.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

extension View {
    func topPadding(_ value: CGFloat = .normal) -> some View {
        padding(.top, value)
    }

    func bottomPadding(_ value: CGFloat = .normal) -> some View {
        padding(.bottom, value)
    }

    func leadingPadding(_ value: CGFloat = .normal) -> some View {
        padding(.leading, value)
    }

    func trailingPadding(_ value: CGFloat = .normal) -> some View {
        padding(.trailing, value)
    }

    func hPadding(_ value: CGFloat = .normal) -> some View {
        padding(.horizontal, value)
    }

    func vPadding(_ value: CGFloat = .normal) -> some View {
        padding(.vertical, value)
    }

    func allPadding(_ value: CGFloat = .normal) -> some View {
        padding(.all, value)
    }
}
