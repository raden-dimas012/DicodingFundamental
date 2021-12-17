//
//  FavoriteViewModel.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 09/11/21.
//

import Foundation
import CoreData

class FavoriteViewModel: ObservableObject {
    let coreDataManager = CoreDataManager.instance
//    func saveData() {
//        DispatchQueue.main.async {
//            self.coreDataManager.save()
//        }
//    }
//
//    func getFavoriteGame(id: Int32) -> NSFetchRequest<FavoriteEntity> {
//        let predicate = NSPredicate(format: "id contains \(id)")
//         let fetch = NSFetchRequest<FavoriteEntity>(entityName: FavoriteEntity.entity().name ?? "FavoriteEntity")
//         fetch.predicate = predicate
//         return fetch
//     }
//
//    func removeFromFavorite(id: Int32) {
//        do {
//            let gameFav = try self.coreDataManager.context.fetch(getFavoriteGame(id: id))
//            if let game = gameFav.first {
//                DispatchQueue.main.async {
//                    self.coreDataManager.context.delete(game)
//                }
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//        saveData()
//    }
}
