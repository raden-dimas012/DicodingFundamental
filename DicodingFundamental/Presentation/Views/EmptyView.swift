//
//  EmptyView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 17/11/21.
//

import SwiftUI

struct EmptyView: View {
    let constant = ConstantFavoriteView()
    var body: some View {
        EmptyAnimationView(jsonFile: constant.favoriteNotFoundJson)
            .overlay(
                Text(constant.favoriteNotFoundTitle)
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
