//
//  GameFavoriteProvider.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 05/11/21.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()

    var container: NSPersistentContainer
    let context: NSManagedObjectContext
    init() {
        container = NSPersistentContainer(name: "FavoriteGame")
        container.loadPersistentStores { ( _ ,error)  in
            if let error = error {
                print("Error loading core data.\(error)")
            }
        }
        context = container.viewContext

    }
    func save() {
        do {
            try context.save()
            print("Saved Successfully")
        } catch let error {
            print("ERROR Save Data..\(error)")
        }
    }
}
