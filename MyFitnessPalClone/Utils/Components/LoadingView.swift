//
//  LoadingView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct LoadingView: View {
    let style: LoadingStyle
//    @Environment(\.loadingManager) private var loadingManager
    @State private var loadingManager = LoadingManagerTest.shared
    var body: some View {
        switch style {
            case .bottom:
                if loadingManager.isLoading {
                    VStack(spacing: .low) {
                        ProgressView()
                            .scaleEffect(1.6)
                            .tint(.cBlack)
                        Text("Loading...")
                            .font(.footnote)
                            .foregroundStyle(.cBlack)
                    }
                }

            case .center:
                if loadingManager.isLoading {
                    VStack(spacing: .low) {
                        ProgressView()
                            .scaleEffect(1.8)
                            .tint(.cBlack)
                        Text("Loading...")
                            .font(.footnote)
                            .foregroundStyle(.cBlack)
                    }
                }

            case .topTrailing:
                if loadingManager.isLoading {
                    ProgressView()
                        .scaleEffect(1.25)
                        .tint(.cBlack)
                }
        }
    }
}

enum LoadingStyle: Hashable {
    case bottom
    case center
    case topTrailing
}
