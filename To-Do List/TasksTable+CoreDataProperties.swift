//
//  TasksTable+CoreDataProperties.swift
//  To-Do List
//
//  Created by Phat Pham on 12/22/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import Foundation
import CoreData


extension TasksTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TasksTable> {
        return NSFetchRequest<TasksTable>(entityName: "TasksTable");
    }

    @NSManaged public var name: String?
    @NSManaged public var details: String?

}
