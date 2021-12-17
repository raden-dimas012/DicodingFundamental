//
//  ContentView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 07/10/21.
//

/*
 - Loading Screen wheen load data (done)
 - Launchscreen
 - Using CoreData for save data to favorie and show it (done)
 - Detail View UI (done)
 - Favorite View UI (done)
 - Profile View UI (done)
 - Settings View UI (Dark mode & local notification or push notifications) (done)
 - Unit Testing
 - Implement DI if i can and singleton pattern
 - No Item View for when data is nothing or null (done)
 - Assets for UI
 - Lottie Animation / Redaction Loading (done)
 - Convert Format Date
 - Checking Network First
 - Change all the strings to constant
 - Cache Image
 - SwiftLint
 - Readmore in detail desc
 - Figma
 - Add tap gesture on profile photo
 */

import SwiftUI

struct ContentView: View {
    @State var tabSelection: Tabs = .home
    let constant = ConstantContentView()
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    @AppStorage("reminderEnabled") private var reminderEnabled = false
    var body: some View {
        NavigationView {
            TabView(selection:$tabSelection) {
                HomeView()
                        .tabItem {
                            Image(systemName: constant.imageHome)
                            Text(constant.home)
                        }
                        .tag(Tabs.home)
                FavoriteView()
                    .tabItem {
                        Image(systemName: constant.imageFavorite)
                        Text(constant.favorite)
                    }
                    .tag(Tabs.favorite)
                SettingsView(darkModeEnabled: $darkModeEnabled, systemThemeEnabled: $systemThemeEnabled, reminderEnabled: $reminderEnabled)
                    .tabItem {
                        Image(systemName: constant.imageSettings)
                        Text(constant.settings)
                    }
                    .tag(Tabs.settings)
                ProfileView()
                    .tabItem {
                        Image(systemName: constant.imageProfile)
                        Text(constant.profile)
                    }
                    .tag(Tabs.profile)
            }
            .navigationBarTitle(returnNavBarTitle(tabSelection: self.tabSelection))
        }
        .onAppear {
            SystemThemeManager.instance.handleTheme(darkMode: darkModeEnabled, systemMode: systemThemeEnabled)
            ReminderManager.instance.setUpReminder(isReminder: reminderEnabled)
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
