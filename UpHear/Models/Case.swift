//
//  Case.swift
//  UpHear
//
//  Created by Timothy Ananda on 31/07/21.

import Foundation

struct CaseData: Codable {
    let records: [CaseDataResponse]?
}

struct CaseDataResponse: Codable {
    let id: String?
    let fields: Case?
    let createdTime: String?
}

struct Case: Codable {
    let caseID: String?
    let reporterID: [String]?
    let reporterName: String?
    let isAnonymous: Bool?
    let victimID: [String]?
    let victimName: String?
    let perpetratorID: [String]?
    let perpetratorName: String?
    let incidentTime: String?
    let incidentPlace: String?
    let incidentDetail: String?
    let status: String?
    
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
}

enum caseStatus: String {
    case ongoing = "On-Going"
    case waiting = "Waiting"
    case closed = "Closed"
}
