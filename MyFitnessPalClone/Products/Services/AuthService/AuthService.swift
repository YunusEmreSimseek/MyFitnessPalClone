//
//  AuthService.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 19.08.2024.
//

import FirebaseAuth

/// Authentication service protocol
protocol IAuthService {
    /// Method for signing up with email and password
    func signUp(email: String, password: String) async -> String?

    /// Method for signing in with email and password
    func signIn(email: String, password: String) async -> String?

    /// Method for signing out
    func signOut() -> Bool

    /// Method for checking if user is authenticated
    func checkAuthUser() -> String?
}

extension IAuthService {
    var db: Auth {
        Auth.auth()
    }
}

/// Example authentication service class
final class AuthService: IAuthService {
    func signUp(email: String, password: String) async -> String? {
        do {
            let response = try await db.createUser(withEmail: email, password: password)
            return response.user.uid
        } catch {
            print("Error while creating user: \(error)")
            return nil
        }
    }

    func signIn(email: String, password: String) async -> String? {
        do {
            try await db.signIn(withEmail: email, password: password)
            return db.currentUser?.uid
        } catch {
            print("Error while signing in: \(error)")
            return nil
        }
    }

    func signOut() -> Bool {
        do {
            try db.signOut()
            return true
        } catch {
            print("Error while signing out: \(error)")
            return false
        }
    }

    func checkAuthUser() -> String? {
        if db.currentUser != nil {
            db.currentUser?.uid
        } else {
            nil
        }
    }
}
