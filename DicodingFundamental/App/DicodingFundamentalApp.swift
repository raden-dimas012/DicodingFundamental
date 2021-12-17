//
//  DicodingFundamentalApp.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 07/10/21.
//

import SwiftUI

@main
struct DicodingFundamentalApp: App {
    let coreDataManager = CoreDataManager.instance
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.context)
        }.onChange(of: scenePhase ) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("background")
                coreDataManager.save()
            case .inactive:
                print("inactive")
            case .active:
                print("active")
            @unknown default:
                print("something must have changed")
            }
        }
    }
}
