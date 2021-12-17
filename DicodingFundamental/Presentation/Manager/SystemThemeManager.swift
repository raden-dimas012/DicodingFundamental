//
//  SystemThemeManager.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 15/10/21.
//

import Foundation
import UIKit

class SystemThemeManager {
    static let instance = SystemThemeManager()
    func handleTheme(darkMode:Bool,systemMode:Bool) {
        guard !systemMode else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
            return
        }
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
}
