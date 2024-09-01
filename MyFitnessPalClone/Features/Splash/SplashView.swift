//
//  SplashView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var splashVM = SplashViewModel()
    private var navManager = NavigationManager.shared
    var body: some View {
        @Bindable var navManager = navManager
        NavigationStack(path: $navManager.path) {
            BodyView()
                .ignoresSafeArea()
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                        case .start: StartView().navigationBarBackButtonHidden()
                        case .signUp: SignUpView().navigationBarBackButtonHidden()
                        case .logIn: LogInView().navigationBarBackButtonHidden()
                        case .onboard: OnboardView().navigationBarBackButtonHidden()
                        case .home: HomeView().navigationBarBackButtonHidden()
                    }
                }
        }

        .onAppear {
            Task { await splashVM.checkAuthUser() }
            splashVM.requestNotificationPermission()
        }
        .environment(splashVM)
    }
}

#Preview {
    NavigationStack {
        SplashView()
    }
}

private struct BodyView: View {
    @Environment(SplashViewModel.self) private var splashVM
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack { Spacer() }
            AppTitleText()
            Spacer()
            Spacer()
        }
        .modifier(BottomLoadingModifier())
        .blueBackground()
    }
}
