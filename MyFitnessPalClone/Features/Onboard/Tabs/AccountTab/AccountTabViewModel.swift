//
//  AccountTabViewModel.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

@Observable
final class AccountTabViewModel {
    var email = ""
    var password = ""
    var isChecked = false
    private var onboardVM: OnboardViewModel?

    func setOnboardViewModel(onboardVM: OnboardViewModel) {
        self.onboardVM = onboardVM
    }

    func setEmailAndPassword() {
        onboardVM?.selectedEmail = email
        onboardVM?.selectedPassword = password
    }
}
