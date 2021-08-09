//
//  Case.swift
//  UpHear
//
//  Created by Timothy Ananda on 31/07/21.

import Foundation

struct CaseData: Codable {
    let records: [CaseDataResponse]?
}

struct CaseDataResponse: Codable, Identifiable {
    let id: String?
    let fields: Case?
    let createdTime: String?
}

class Case: Codable {
    var caseID: Int
    var reporterID: [String]
    var reporterName: [String]
    var isAnonymous: String
    var victimID: [String]
    var victimName: [String]
    var perpetratorID: [String]
    var perpetratorName: [String]
    var incidentTime: String
    var incidentPlace: String
    var incidentDetail: String
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case caseID = "CaseID"
        case reporterID = "Reporter"
        case reporterName = "Name (from Reporter)"
        case isAnonymous = "isAnonymous"
        case victimID = "Victim"
        case victimName = "Name (from Victim)"
        case perpetratorID = "Perpetrator"
        case perpetratorName = "Name (from Perpetrator)"
        case incidentTime = "IncidentTime"
        case incidentPlace = "IncidentPlace"
        case incidentDetail = "IncidentDetail"
        case status = "Status"
    }
    
    init() {
        caseID = 0
        reporterID = [""]
        reporterName = [""]
        isAnonymous = "false"
        victimID = [""]
        victimName = [""]
        perpetratorID = [""]
        perpetratorName = [""]
        incidentTime = ""
        incidentPlace = ""
        incidentDetail = ""
        status = caseStatus.waiting.rawValue
    }
}

enum caseStatus: String {
    case waiting = "Waiting"
    case ongoing = "Ongoing"
    case closed = "Closed"
}
