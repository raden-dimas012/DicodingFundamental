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
    let constant = ConstantApp()
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.context)
        }.onChange(of: scenePhase ) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print(constant.backgroundLifeCycle)
                coreDataManager.save()
            case .inactive:
                print(constant.inactiveLifeCycle)
            case .active:
                print(constant.activeLifeCycle)
            @unknown default:
                print(constant.defaultLifeCycle)
            }
        }
    }
}
