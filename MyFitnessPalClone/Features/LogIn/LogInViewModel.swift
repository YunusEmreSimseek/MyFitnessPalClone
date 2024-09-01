//
//  LogInViewModel.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 21.08.2024.
//

import SwiftUI

@Observable
final class LogInViewModel {
    var email = ""
    var password = ""

    @ObservationIgnored
    private var authService: IAuthService

    private var userService: IFirestoreService

    init(authService: IAuthService = AuthService(), userService: IFirestoreService = FirestoreService(FirestoreCollections.users)) {
        self.authService = authService
        self.userService = userService
    }

    func login() async {
        guard !email.isEmpty, !password.isEmpty else {
            print("Email or password is empty")
            return
        }
        LoadingManagerTest.testStartLoading()
        guard let uid = await authService.signIn(email: email, password: password)
        else {
            print("User could not sign in")
            LoadingManagerTest.testStopLoading()
            return
        }
        print("User signed in successfully")
        guard let user: UserModel? = await userService.fetchItem(docId: uid)
        else {
            print("User could not sign in")
            LoadingManagerTest.testStopLoading()
            return
        }
        UserManager.setState(.loggedIn)
        UserManager.setUser(user!)
        NavigationManager.navigate(to_: .home)
        LoadingManagerTest.testStopLoading()
    }
}
