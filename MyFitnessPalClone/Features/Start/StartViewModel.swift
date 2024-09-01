//
//  StartViewModel.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

@Observable
final class StartViewModel {
    func navigateSignUp() {
        NavigationManager.navigate(to_: .signUp)
    }

    func navigateLogIn() {
        NavigationManager.navigate(to_: .logIn)
    }
}
