//
//  NavigationManager.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

// @Observable
// final class NavigationManager {
//    var path: NavigationPath = .init()
//
//    func navigate(to_ destination: Destination) {
//        path.append(destination)
//    }
//
//    func navigateToBack() {
//        path.removeLast()
//    }
//
//    func navigateToRoot() {
//        path.removeLast(path.count)
//    }
// }
@Observable
final class NavigationManager {
    private init() {}
    static let shared = NavigationManager()
    var path = NavigationPath()

    static func getPath() -> NavigationPath {
        shared.path
    }

    static func navigate(to_ destination: Destination) {
        shared.path.append(destination)
    }

    static func navigateToBack() {
        shared.path.removeLast()
    }

    static func navigateToRoot() {
        shared.path.removeLast(shared.path.count)
    }
}

enum Destination: Hashable {
    case start
    case signUp
    case logIn
    case onboard
    case home
}

// struct NavigationManagerKey: EnvironmentKey {
//    static var defaultValue = NavigationManager()
// }
