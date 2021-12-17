//
//  EmptyView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 17/11/21.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        EmptyAnimationView(jsonFile: "not-found")
            .overlay(
                Text("Please add your favorite game.")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .padding(.top,100)
            )
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
