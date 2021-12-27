//
//  ReminderManager.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 16/11/21.
//

import SwiftUI
import UserNotifications

class ReminderManager {
    static let instance = ReminderManager()
    let constant = ConstantSettingsView()
    func setUpReminder(isReminder: Bool) {
        if isReminder {
            scheduleNotification()
        } else {
            cancelNotification()
        }
    }
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success,error) in
            if let error = error {
                print("ERROR\(error)")
            } else {
                print("SUCCESS\(success)")
            }
        }
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = constant.reminderTitleNotification
        content.subtitle = constant.reminderSubTitleNotification
        content.sound = .default
        content.badge = 1
        if #available(iOS 15.0, *) {
            content.interruptionLevel = .timeSensitive
        } else {
            // Fallback on earlier versions
        }
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 11
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,repeats: true)
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
