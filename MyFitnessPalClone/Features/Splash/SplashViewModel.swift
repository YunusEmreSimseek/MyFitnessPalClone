//
//  SplashViewModel.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI
import UserNotifications

@Observable
final class SplashViewModel {
    private var authService: IAuthService

    private var userService: IFirestoreService

    init(authService: IAuthService = AuthService(), userService: IFirestoreService = FirestoreService(FirestoreCollections.users)) {
        self.authService = authService
        self.userService = userService
    }

    func requestNotificationPermission() {
        #if DEBUG
        print("DEBUG MODE")
//        LoadingManagerTest.testStartLoading()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            withAnimation(.easeInOut) {
//                self.navigateStart()
//            }
//            LoadingManagerTest.testStopLoading()
//        }

        #else
        print("RELEASE MODE")
        NotificationManager.checkNotificationPermission { result in
            guard !result else {
                print("Permission granted already")
                self.navigateStart()
                return
            }
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
                granted, error in
                if let error {
                    print("Permission Error: \(error)")
                } else {
                    print("Permission granted: \(granted)")
                    self.navigateStart()
                }
            }
        }
        #endif
    }

    func navigateStart() {
        NavigationManager.navigate(to_: .start)
    }

    private func navigateHome() {
        NavigationManager.navigate(to_: .home)
    }

    func checkAuthUser() async {
        guard let uid = authService.checkAuthUser() else {
            navigateStart()
            return
        }
        LoadingManagerTest.testStartLoading()
        guard let user: UserModel? = await userService.fetchItem(docId: uid) else {
            LoadingManagerTest.testStopLoading()
            return
        }
        UserManager.setState(.loggedIn)
        UserManager.setUser(user!)
        LoadingManagerTest.testStopLoading()
        navigateHome()
    }
}
