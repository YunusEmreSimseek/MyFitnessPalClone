//
//  LoadingManager.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

// @Observable
// final class LoadingManager {
//    private(set) var isLoading = false
//
//    func startLoading() {
//        isLoading = true
//    }
//
//    func stopLoading() {
//        isLoading = false
//    }
//
//    static func testStartLoading() {
//        LoadingManager().isLoading = true
//    }
//
//    static func testStopLoading() {
//        LoadingManager().isLoading = false
//    }
// }

@Observable
final class LoadingManagerTest {
    private(set) var isLoading = false

    private init() {}

    static let shared = LoadingManagerTest()

    static func testStartLoading() {
        shared.isLoading = true
        print("isloading: \(shared.isLoading)")
    }

    static func testStopLoading() {
        shared.isLoading = false
        print("isloading: \(shared.isLoading)")
    }

    static func isLoading() -> Bool {
        return shared.isLoading
    }
}

// struct LoadingManagerKey: EnvironmentKey {
//    static var defaultValue = LoadingManager()
// }
