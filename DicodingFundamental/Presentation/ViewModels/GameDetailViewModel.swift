//
//  GameDetailViewModel.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 12/10/21.
//

import SwiftUI
import Combine
import CoreData

class GameDetailViewModel: ObservableObject {
    @Published var id: Int
    @Published var name: String?
    @Published var release: String?
    @Published var image: String?
    @Published var rating: Double?
    @Published var totalReview: Int?
    @Published var description: String?
    @Published var website: String?

    let coreDataManager = CoreDataManager.instance
    private let dataService: GameDetailDataService
    var cancellables = Set<AnyCancellable>()
    @Published var gameFavorite: [FavoriteEntity] = []
    init(id: Int) {
        self.id = id
        self.dataService = GameDetailDataService(id: id)
        getDetailGame()
    }
    func getDetailGame() {
        dataService.$gameDetail
            .sink { [weak self] (returnedGameDetail) in
                DispatchQueue.main.async {
                    self?.id = returnedGameDetail?.id ?? 0
                    self?.name = returnedGameDetail?.name
                    self?.release = returnedGameDetail?.release
                    self?.image = returnedGameDetail?.image
                    self?.rating = returnedGameDetail?.rating
                    self?.totalReview = returnedGameDetail?.totalReview
                    self?.description = returnedGameDetail?.description
                    self?.website = returnedGameDetail?.website
                }
            }
            .store(in: &cancellables)
    }
    func addToFavorite(id: Int?,name: String?,image:String?,release:String?) {
        let newFavorite = FavoriteEntity(context: coreDataManager.context)
        newFavorite.id = Int32(id ?? 0)
        newFavorite.name = name
        newFavorite.image = image
        newFavorite.date = release
        saveData()
    }
    func saveData() {
        DispatchQueue.main.async {
            self.coreDataManager.save()
        }
    }
   func getFavoriteGame() -> NSFetchRequest<FavoriteEntity> {
       let predicate = NSPredicate(format: "id contains \(id)")
        let fetch = NSFetchRequest<FavoriteEntity>(entityName: FavoriteEntity.entity().name ?? "FavoriteEntity")
        fetch.predicate = predicate
        return fetch
    }
   func isExistsOnDB() -> Bool {
        do {
            let count = try coreDataManager.context.count(for: getFavoriteGame())
            return count > 0
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    func removeFromFavorite() {
        do {
            let gameFav = try self.coreDataManager.context.fetch(getFavoriteGame())
            if let game = gameFav.first {
                DispatchQueue.main.async {
                    self.coreDataManager.context.delete(game)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        saveData()
    }
}
