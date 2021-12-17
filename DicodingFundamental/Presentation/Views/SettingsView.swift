//
//  SettingsView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 07/10/21.
//

import SwiftUI

struct SettingsView: View {
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    @Binding var reminderEnabled: Bool
    let constant = ConstantSettingsView()
    var body: some View {
        Form {
            Section(header: Text(constant.titleDisplaySettings), footer: Text(constant.descriptionThemeMode)) {
                Toggle(isOn: $darkModeEnabled, label: {
                    Image(systemName: constant.imageDarkMode)
                    Text(constant.darkModeTitle)
                }).onChange(of: darkModeEnabled, perform: { _ in
                    SystemThemeManager.instance.handleTheme(darkMode: darkModeEnabled, systemMode: systemThemeEnabled)
                })
                Toggle(isOn: $systemThemeEnabled, label: {
                    Image(systemName: constant.imageSystemMode)
                    Text(constant.systemModeTitle)
                }).onChange(of: darkModeEnabled, perform: { _ in
                    SystemThemeManager.instance.handleTheme(darkMode: darkModeEnabled, systemMode: systemThemeEnabled)
                })
            }
            Section(header: Text(constant.titleReminderSettings), footer: Text(constant.descriptionReminder)) {
                Toggle(isOn: $reminderEnabled, label: {
                    Image(systemName: constant.imageReminder)
                    Text(constant.reminderTitle)
                }).onChange(of: reminderEnabled, perform: { _ in
                    ReminderManager.instance.requestAuthorization()
                    ReminderManager.instance.setUpReminder(isReminder: reminderEnabled)
                })
            }
        }
    }
}
