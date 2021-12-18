//
//  LoadingView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 19/11/21.
//

import SwiftUI

struct LoadingView: View {
    let constant = ConstantHomeView()
    var body: some View {
        LoadingAnimationView(jsonFile: constant.loadingJson)
            .overlay(
                Text(constant.loadingViewTitle)
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
