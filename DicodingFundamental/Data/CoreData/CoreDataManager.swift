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
    let constant = ConstantCoreData()
    var container: NSPersistentContainer
    let context: NSManagedObjectContext
    init() {
        container = NSPersistentContainer(name: constant.titleContainer)
        container.loadPersistentStores { ( _ ,error)  in
            if let error = error {
                print("\(error)")
            }
        }
        context = container.viewContext

    }
    func save() {
        do {
            try context.save()
            print(constant.savedCoreDataSuccess)
        } catch let error {
            print("\(error)")
        }
    }
}
