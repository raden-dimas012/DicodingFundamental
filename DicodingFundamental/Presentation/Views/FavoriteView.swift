//
//  FavoriteView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 07/10/21.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FavoriteEntity.entity(), sortDescriptors:[NSSortDescriptor(keyPath: \FavoriteEntity.name, ascending: true)]) private var gameFavorite: FetchedResults<FavoriteEntity>
    @StateObject var viewModel = FavoriteViewModel()

    var body: some View {
        if gameFavorite.isEmpty {
            EmptyView()
        } else {
            List {
                ForEach(gameFavorite) { entity in
                    NavigationLink(destination: DetailView(id: Int(entity.id))) {
                        GameView(gameFav: entity)
                    }
                }
            }
            .padding(.top,10)
            .listStyle(PlainListStyle())
        }
    }
}
