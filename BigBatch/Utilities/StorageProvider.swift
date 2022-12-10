//
//  StorageProvider.swift
//  BigBatch
//
//  Created by James on 12/6/22.
//

import Foundation
import CoreData

class StorageProvider {
    
    static var sharedStorageProvider = StorageProvider()

    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "BigBatch")
        
        persistentContainer.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)")
            }
        })
    }
}
