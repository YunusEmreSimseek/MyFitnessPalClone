//
//  StartView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct StartView: View {
    @State private var startVM = StartViewModel()
    var body: some View {
        VStack {
            Spacer()
            AppTitleText()
                .bottomPadding(.dynamicHeight(height: 0.5))
            VStack(spacing: .medium3) {
                SignUpButtonView()
                LogInButtonView()
            }
        }
        .allPadding()
        .bottomPadding()
        .blueBackground()
        .ignoresSafeArea()
        .ignoresSafeArea()
        .environment(startVM)
    }
}

#Preview {
    StartView()
}

private struct SignUpButtonView: View {
    @Environment(StartViewModel.self) private var startVM
    var body: some View {
        ElevatedButton(title: "SIGN UP FOR FREE", onTap: { startVM.navigateSignUp() }, fgColor: .cBlue, bgColor: .white)
    }
}

private struct LogInButtonView: View {
    @Environment(StartViewModel.self) private var startVM
    var body: some View {
        Button("LOG IN", action: { startVM.navigateLogIn() })
            .foregroundStyle(.white)
            .font(.headline)
            .fontWeight(.bold)
    }
}
