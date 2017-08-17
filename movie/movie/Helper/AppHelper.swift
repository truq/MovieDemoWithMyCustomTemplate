//
//  AppHelper.swift
//  movie
//
//  Created by NGI-Noman on 16/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import Foundation



private let singleton = AppHelper()

public class AppHelper: NSObject {
    
    class var shared: AppHelper{
        
        return singleton
    }
    
    var currentSearchStr = ""
    var suggestionArray : [RecentSearched]!
    var pageNumber = 0
    var totalPages = 0

    
    func loadRecentSearched() {
    
         let ascendingSortDescriptor = NSSortDescriptor(key: #keyPath(RecentSearched.searchTime), ascending: false)
         suggestionArray = DataManager.fetchObjects(entity: RecentSearched.self, predicate: nil, sortDescriptors: [ascendingSortDescriptor], context: DataManager.mainContext)
    }
}

