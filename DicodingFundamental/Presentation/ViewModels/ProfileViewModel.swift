//
//  ProfileViewModel.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 04/11/21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    static let instance = ProfileViewModel()
    let constant = ConstantProfileView()
    let myProfile: Profile
    init() {
        myProfile = .init(name: constant.myName, birth: constant.myBirth, email: constant.myEmail, role: constant.myRole, image: constant.myPhoto)
    }
}
