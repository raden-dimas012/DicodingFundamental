//
//  HomeView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 07/10/21.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = GameViewModel()
    var body: some View {
        ZStack {
            if viewModel.games.count > 0 {
                GameListView(viewModel: viewModel, game: viewModel.games)
            } else {
                LoadingView()
            }
        }
    }
}
