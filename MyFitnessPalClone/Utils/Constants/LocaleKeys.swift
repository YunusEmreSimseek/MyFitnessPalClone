//
//  LocaleKeys.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 21.08.2024.
//

import Foundation

enum LocaleKeys {
    enum Buttons {
        static let continue_ = "Continue"
        static let google = "Continue with Google"
        static let apple = "Continue with Apple"
        static let facebook = "Continue with Facebook"
        static let logIn = "Log In"
        static let signUp = "Sign Up"
        static let forgotPassword = "Forgot Password?"
        static let next = "NEXT"
    }

    enum Pages {
        static let splash = "Splash"
        static let signUp = "Sign Up"
        static let logIn = "Log In"
        static let goalsTab = "Goals"
        static let personalTab = "Personal"
        static let physicalTab = "Physical"
        static let accountTab = "Account"
    }

    enum Fields {
        static let email = "Email"
        static let password = "Password"
    }

    enum SignUp {
        static let navigationTitle = "Sign Up"
        static let title = "Welcome! Let's customize MyFitnessPal for your goals."
        static let or = "OR"
        static let subtitleText = "We will never post anything without your permission."
        static let bottomTextFirst = "We will collect personal information form and about you and use it for various purposes, including to customize your MyFitnessPal experience. Read more about the purposes our partices your choices, and your rights in our "
        static let bottomTextSecond = "Privacy Policy"
        static let bottomTextThird = "."
    }

    enum LogIn {
        static let navigationTitle = "Log In"
        static let or = "OR"
        static let subtitleText = "We will never post anything without your permission."
    }

    enum GoalsTab {
        static let title = "Let's start with goals"
        static let subtitle = "Select up to three that are most important to you."
        static let loseWeight = "Lose Weight"
        static let maintainWeight = "Maintain Weight"
        static let gainMuscle = "Gain Muscle"
        static let modifyDiet = "Modify Diet"
        static let manageStress = "Manage Stress"
        static let increaseStepCount = "Increase Step Count"
    }

    enum PersonalTab {
        static let title = "Tell us a little bit about yourself"
        static let genderTitle = "Please select which sex we should use to calculate your calorie needs:"
        static let genderSubTitle = "Which one should I choose?"
        static let ageTitle = "How old are you?"
        static let ageSubTitle = "We use biological sex at birth and age to calculate an accurate goal for you."
        static let locationTitle = "Where do you live?"
    }
}
