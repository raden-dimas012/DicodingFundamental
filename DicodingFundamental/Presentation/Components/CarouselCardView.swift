//
//  CarouselCardView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 06/11/21.
//

import SwiftUI
import Kingfisher

struct CarouselCardView: View {
    var game: Game
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            ZStack {
                KFImage.url(URL(string: game.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 30, height: size.height)
                    .cornerRadius(15)
            }
            .padding(.horizontal,15)
        }
    }
}
