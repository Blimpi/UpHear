//
//  Action.swift
//  UpHear
//
//  Created by Timothy Ananda on 31/07/21.
//

import Foundation

struct HRActionData: Codable {
    let records: [UserDataResponse]?
}

struct HRActionDataResponse: Codable, Identifiable {
    let id: String?
    let fields: User?
    let createdTime: String?
}

class HRAction: Codable {
    var title: String?
    var description: String?
    var requireEvidence: String?
    var isCompleted: String?
    var dueDate: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case description = "Description"
        case requireEvidence = "Require Evidence"
        case isCompleted = "isCompleted"
        case dueDate = "DueDate"
    }
}
