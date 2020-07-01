//
//  Task+CoreDataProperties.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation
import CoreData

extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var title: String?
    @NSManaged public var notes: String?
    @NSManaged public var isDone: Bool?
    @NSManaged public var creationDate: Date?

}
