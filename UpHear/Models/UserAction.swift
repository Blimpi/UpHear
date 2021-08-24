//
//  UserAction.swift
//  UpHear
//
//  Created by Timothy Ananda on 31/07/21.
//

import Foundation

struct UserActionData: Codable {
    let records: [UserDataResponse]?
}

struct UserActionDataResponse: Codable, Identifiable {
    let id: String?
    let fields: User?
    let createdTime: String?
}

class UserAction: Codable {
    var title: String?
    var description: String?
    var attachments: String?
    var hrDescription: String?
    var hrTitle: String?
    var hrRequireEvidence: String?
    var hrDueDate: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case description = "Description"
        case attachments = "Attachments"
        case hrDescription = "Description (from HRAction)"
        case hrTitle = "Title (from HRAction)"
        case hrRequireEvidence = "Require Evidence (from HRAction)"
        case hrDueDate = "Due Date (from HRAction)"
    }
}

