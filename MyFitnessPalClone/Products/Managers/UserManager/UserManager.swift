//
//  UserManager.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 25.08.2024.
//

import FirebaseFirestore
import SwiftUI

@Observable
final class UserManager {
    private init() {}
    private static let shared = UserManager()
    private var user: UserModel?
    private var state: UserState = .loggedOut

    static func getUser() -> UserModel? { shared.user }
    static func setUser(_ user: UserModel) {
        shared.user = user
        print("USERMANAGER: User set to \(shared.user.debugDescription)")
    }

    static func getState() -> UserState { shared.state }
    static func setState(_ state: UserState) { shared.state = state
        print("USERMANAGER: State set to \(shared.state)")
    }

    static func removeUser() {
        shared.user = nil
    }
}

enum UserState {
    case loggedIn
    case loggedOut
}
