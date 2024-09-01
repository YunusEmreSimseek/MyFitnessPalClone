//
//  LogInView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct LogInView: View {
    @State private var loginVM = LogInViewModel()
    var body: some View {
        VStack(spacing: .medium2) {
            Spacer()

            HeaderView()

            Button(LocaleKeys.Buttons.forgotPassword, action: {})
                .font(.footnote)

            DividerView()

            SocialButtonsView()

            Text(LocaleKeys.LogIn.subtitleText)
                .boldCaptionText()
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .hPadding()

            Spacer()
        }
        .allPadding()
        .navigationTitle(LocaleKeys.LogIn.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .backButtonModifier()
        .topTrailingLoading()
        .themedBackground()
        .environment(loginVM)
    }
}

#Preview {
    NavigationStack {
        LogInView()
    }
}

private struct HeaderView: View {
    @Environment(LogInViewModel.self) private var loginVM
    var body: some View {
        @Bindable var loginVM = loginVM
        VStack(spacing: .normal) {
            RemovableTextField(placeHolder: LocaleKeys.Fields.email, text: $loginVM.email)
            RemovableTextField(placeHolder: LocaleKeys.Fields.password, text: $loginVM.password)
            ElevatedButton(title: LocaleKeys.Buttons.logIn, onTap: { Task { await loginVM.login() }}, bgColor: .cBlue)
        }
    }
}

private struct DividerView: View {
    var body: some View {
        HStack {
            VStack { Divider() }
            Text(LocaleKeys.LogIn.or)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .hPadding()
            VStack { Divider() }
        }
    }
}

private struct SocialButtonsView: View {
    var body: some View {
        VStack {
            SocialButton(title: LocaleKeys.Buttons.google, image: .google, onTap: {})
            SocialButton(title: LocaleKeys.Buttons.apple, image: .apple, onTap: {})
            SocialButton(title: LocaleKeys.Buttons.facebook, image: .facebook, onTap: {})
        }
    }
}
