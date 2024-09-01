//
//  OnboardViewModel.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

@Observable
final class OnboardViewModel {
    let totalParts: Int = 4
    var progress: Int = 0
    var selectedGoals: [OnboardGoals] = []
    var selectedGender: Gender = .firstCase
    var selectedAge: String = ""
    var selectedLocation: Locations = .turkey
    var selectedZipCode: String = ""
    var selectedHeight: String = ""
    var selectedWeight: String = ""
    var selectedGoalWeight: String = ""
    var selectedEmail: String = ""
    var selectedPassword: String = ""
    let navigationTitles = [LocaleKeys.Pages.goalsTab, LocaleKeys.Pages.goalsTab, LocaleKeys.Pages.personalTab, LocaleKeys.Pages.physicalTab, LocaleKeys.Pages.accountTab]

    @ObservationIgnored
    private var userService = FirestoreService(.users)

    @ObservationIgnored
    private var authService = AuthService()

    func finishOnboard() async {
        LoadingManagerTest.testStartLoading()
        guard let uid = await createAuthUser()
        else {
            print("Onboard finished")
            LoadingManagerTest.testStopLoading()
            return
        }
        let user = await createUser(uid: uid)
        print("Onboard finished")
        UserManager.setState(.loggedIn)
        UserManager.setUser(user)
        navigateHome()
        LoadingManagerTest.testStopLoading()
    }

    private func createUser(uid: String) async -> UserModel {
        let newUser = UserModel(
            id: uid,
            name: "Emre Şimşek",
            email: selectedEmail,
            password: selectedPassword,
            age: selectedAge,
            gender: selectedGender,
            height: selectedHeight,
            weight: selectedWeight,
            goalWeight: selectedGoalWeight,
            location: selectedLocation,
            zipCode: selectedZipCode,
            goals: selectedGoals,
            createdAt: Date()
        )
        let response = await userService.createItem(item: newUser)
        print("User created with response: \(response)")
        return newUser
    }

    private func createAuthUser() async -> String? {
        let response = await authService.signUp(email: selectedEmail, password: selectedPassword)
        return response
    }

    private func navigateHome() {
        NavigationManager.navigate(to_: .home)
    }
}
