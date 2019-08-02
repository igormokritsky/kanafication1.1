//
//  KanaCoreData+CoreDataProperties.swift
//  Kanafication
//
//  Created by Romi_Khan on 03/05/2019.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//
//

import Foundation
import CoreData


extension KanaCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<KanaCoreData> {
        return NSFetchRequest<KanaCoreData>(entityName: "KanaCoreData")
    }

    @NSManaged public var helpingText: String?
    @NSManaged public var transformedText: String?

}
