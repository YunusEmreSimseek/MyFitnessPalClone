//
//  NotificationManager.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import NotificationCenter
import UserNotifications

struct NotificationManager {
    private init() {}

    static func checkNotificationPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                if settings.authorizationStatus == .authorized {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }

    static func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Yeni Bildirim"
        content.body = "Bu bir deneme bildirimi."
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error {
                print("Bildirim gönderilemedi: \(error.localizedDescription)")
            }
        }
    }
}
