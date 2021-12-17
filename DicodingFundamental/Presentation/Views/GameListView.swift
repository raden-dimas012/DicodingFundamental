//
//  GameListView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 15/10/21.
//

import SwiftUI

struct GameListView: View {
    @StateObject var viewModel = GameViewModel()
    var game: [Game]
    var body: some View {
        VStack {
            GeometryReader { proxy in
                let size = proxy.size
                VerticalCarouselList {
                    LazyVStack {
                        ForEach(game) { game in
                            NavigationLink(destination: DetailView(id: game.id)) {
                                CarouselCardView(game: game)
                                    .frame(height: size.height - 20)
                                    .padding(.top,10)
                            }
                        }
                    }
                }
            }
        }
    }
}
