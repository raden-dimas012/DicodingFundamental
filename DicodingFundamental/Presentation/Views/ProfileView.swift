//
//  ProfileView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 07/10/21.
//

import SwiftUI

struct ProfileView: View {
    let profileVM = ProfileViewModel.instance
    let constant = ConstantProfileView()
    var body: some View {
        VStack {
            Image(profileVM.myProfile.image)
                .resizable()
                .frame(width: 170, height: 170)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 5)
                .padding()
            Form {
                Section(header: Text(constant.name)) {
                    HStack {
                        Image(systemName: constant.imageName)
                        Text(profileVM.myProfile.name)
                    }
                }
                Section(header: Text(constant.birth)) {
                    HStack {
                        Image(systemName: constant.imageBirth)
                        Text(profileVM.myProfile.birth)
                    }
                }
                Section(header: Text(constant.email)) {
                    HStack {
                        Image(systemName: constant.imageEmail)
                        Text(profileVM.myProfile.email)
                    }
                }
                Section(header: Text(constant.role)) {
                    HStack {
                        Image(systemName: constant.imageRole)
                        Text(profileVM.myProfile.role)
                    }
                }
            }
        }
    }
}
