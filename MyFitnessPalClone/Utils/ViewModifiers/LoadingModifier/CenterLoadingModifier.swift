//
//  CenterLoadingModifier.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct CenterLoadingModifier: ViewModifier {
//    @Environment(\.loadingManager) private var loadingManager
    @State private var loadingManager = LoadingManagerTest.shared
    func body(content: Content) -> some View {
        ZStack {
            content

            if loadingManager.isLoading {
                Color.cBlack.opacity(0.3)
                    .ignoresSafeArea()

                VStack(spacing: .normal) {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(1.8)
                        .tint(.cBlack)

                    Text("Loading...")
                        .font(.footnote)
                        .foregroundStyle(.cBlack)
                }
                .allPadding(.medium2)
                .background(.cWhite)
                .clipShape(.rect(cornerRadius: 20))
            }
        }
    }
}
