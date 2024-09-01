//
//  SignUpView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack(spacing: .normal) {
            Spacer()
            HeaderTitleView()
                .bottomPadding()
            ElevatedButton(title: LocaleKeys.Buttons.continue_, onTap: {
                NavigationManager.navigate(to_: .onboard)
            }, bgColor: .cBlue)
            Text(LocaleKeys.SignUp.or)
                .fontWeight(.semibold)
            VStack {
                SocialButton(title: LocaleKeys.Buttons.google, image: .google, onTap: {})
                SocialButton(title: LocaleKeys.Buttons.apple, image: .apple, onTap: {})
            }
            Spacer()
            BottomTextsView()
        }
        .allPadding()
        .bottomPadding()
        .modifier(BackButtonModifier())
        .navigationTitle(LocaleKeys.SignUp.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        .themedBackground()
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}

private struct HeaderTitleView: View {
    var body: some View {
        VStack {
            Text(LocaleKeys.SignUp.title)
                .pageTitleText()
                .hPadding()
                .multilineTextAlignment(.center)
                .opacity(0.9)
        }
    }
}

private struct BottomTextsView: View {
    var body: some View {
        VStack(spacing: .normal) {
            VStack {
                Text(LocaleKeys.SignUp.bottomTextFirst)
                    .foregroundStyle(.gray)
                    + Text(LocaleKeys.SignUp.bottomTextSecond)
                    .foregroundStyle(.cBlue)
                    + Text(LocaleKeys.SignUp.bottomTextThird)
            }
            .semiBoldCaptionText()
        }
        .multilineTextAlignment(.center)
        .lineSpacing(-.low)
    }
}
