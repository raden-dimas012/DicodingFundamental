//
//  GameView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 09/10/21.
//

import SwiftUI
import Kingfisher

struct GameView: View {
    let gameFav: FavoriteEntity
    var body: some View {
            HStack {
                KFImage.url(URL(string: gameFav.image ?? ""))
                    .resizable()
                    .frame(width: 125, height: 175)
                    .cornerRadius(8)
                VStack(alignment: .leading, spacing: 8) {
                    Text(gameFav.name ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(gameFav.date?.toDate().getFormattedDate() ?? "-")
                        .lineLimit(4)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
    }
}
