//
//  LoadingView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 19/11/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        LoadingAnimationView(jsonFile: "loading")
            .overlay(
                Text("Loading....")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                ,alignment: .center)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
