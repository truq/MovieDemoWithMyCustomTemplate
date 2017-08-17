//
//  RecentSearched+CoreDataProperties.swift
//  movie
//
//  Created by NGI-Noman on 07/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension RecentSearched {

    @NSManaged var title: String?
    @NSManaged var searchTime: Date?

}
