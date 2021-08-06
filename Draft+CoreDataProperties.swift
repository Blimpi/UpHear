//
//  Draft+CoreDataProperties.swift
//  UpHear
//
//  Created by Timothy Ananda on 06/08/21.
//
//

import Foundation
import CoreData


extension Draft {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Draft> {
        return NSFetchRequest<Draft>(entityName: "Draft")
    }

    @NSManaged public var caseID: String?
    @NSManaged public var reporterID: String?
    @NSManaged public var reporterName: String?
    @NSManaged public var isAnonymous: String?
    @NSManaged public var victimID: String?
    @NSManaged public var victimName: String?
    @NSManaged public var perpetratorID: String?
    @NSManaged public var perpetratorName: String?
    @NSManaged public var incidentTime: String?
    @NSManaged public var incidentPlace: String?
    @NSManaged public var incidentDetail: String?

}

extension Draft : Identifiable {

}
