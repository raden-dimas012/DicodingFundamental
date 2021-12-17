//
//  Helpers.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 10/10/21.
//

func returnNavBarTitle(tabSelection:Tabs) -> String {
    switch tabSelection {
    case .home: return "Home"
    case .favorite: return "Favorite"
    case .settings: return "Settings"
    case .profile: return "Profile"
    }
}
