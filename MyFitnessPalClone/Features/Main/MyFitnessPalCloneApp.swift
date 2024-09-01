//
//  MyFitnessPalCloneApp.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 16.08.2024.
//

import FirebaseCore
import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    func userNotificationCenter(_: UNUserNotificationCenter, willPresent _: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Notification handling
        completionHandler([.badge, .sound])
    }
}

@main
struct MyFitnessPalCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    @State private var navManager = NavigationManager()

    var body: some Scene {
        WindowGroup {
            SplashView()
//                .environment(navManager)
        }
    }
}
