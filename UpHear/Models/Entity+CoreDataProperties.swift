//
//  Entity+CoreDataProperties.swift
//  UpHear
//
//  Created by Timothy Ananda on 06/08/21.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Draft")
    }

    @NSManaged public var caseID: NSObject?
    @NSManaged public var reporterID: NSObject?
    @NSManaged public var reporterName: NSObject?
    @NSManaged public var isAnonymous: NSObject?
    @NSManaged public var victimID: NSObject?
    @NSManaged public var victimName: NSObject?
    @NSManaged public var perpetratorID: NSObject?
    @NSManaged public var perpetratorName: NSObject?
    @NSManaged public var incidentTime: NSObject?
    @NSManaged public var incidentPlace: NSObject?
    @NSManaged public var incidentDetail: NSObject?

}

extension Entity : Identifiable {

}
