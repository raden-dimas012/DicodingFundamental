//
//  DicodingFundamentalTests.swift
//  DicodingFundamentalTests
//
//  Created by Raden Dimas on 30/11/21.
//

import XCTest
import CoreData
@testable import DicodingFundamental

class DicodingFundamentalTests: XCTestCase {
    var coreDataManager: CoreDataManager = CoreDataManager()
    var mockDetailViewModel: GameDetailViewModel?
    var mockCoreDataManager: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "FavoriteGame")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coreDataManager = CoreDataManager.instance
        coreDataManager.container = mockCoreDataManager
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_init_coreDataManager() {
        let instance = CoreDataManager.instance
        XCTAssertNotNil(instance)
    }
    func test_likeGameToCoreData() {
        let id = 1
        let name = "test_name"
        let image = "test_image"
        let release = "test_release"
        mockDetailViewModel?.addToFavorite(id: id, name: name, image: image, release: release)
        let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteEntity")
        var entitiesCount = 0
        do {
            entitiesCount = try mockCoreDataManager.viewContext.count(for: fetchData)
        } catch let error {
            print("error when fetching from coredata\(error)")
        }
        XCTAssertEqual(entitiesCount, 0)
    }

}
