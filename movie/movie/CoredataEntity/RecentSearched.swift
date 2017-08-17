//
//  RecentSearched.swift
//  movie
//
//  Created by NGI-Noman on 07/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import Foundation
import CoreData


class RecentSearched: NSManagedObject {

    // MARK: Initialization
    
    convenience init(context: NSManagedObjectContext, title: String, searchTime: Date) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: String(describing: RecentSearched.self), in: context) else {
            
            fatalError("Unable to get entity named \(String(describing: RecentSearched.self))")
        }
        
        self.init(entity: entity, insertInto: context)
        self.title = title
        self.searchTime = searchTime
        
    }
    
    
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    @discardableResult
    static func createCoreObject(name: String , time: Date = Date()) -> RecentSearched {
        
        return RecentSearched(context: DataManager.mainContext, title: name, searchTime: time)
        
    }
    
    
    static func saveSearchRecord(searchStr : String) {
        
        createCoreObject(name: searchStr)
        
        DataManager.persist(synchronously: false) { error in
            
            if (error != nil) {
               
               print(error!)
                
            }
            
            
        }
        
        
    }
}
