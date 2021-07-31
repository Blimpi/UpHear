//
//  Case.swift
//  UpHear
//
//  Created by Timothy Ananda on 31/07/21.

import Foundation

struct Case: Codable {
    let caseID: String?
    let createdAt: Date?
    let reporter: User?
    let isAnonymous: Bool?
    let victim: User?
    let perpetrator: User?
    let incidentTime: Date?
    let incidentPlace: String?
    let incidentDetail: String?
    
    enum CodingKeys: String, CodingKey {
        case caseID = "CaseID"
        case createdAt = "Created At"
        case reporter = "Reporter"
        case isAnonymous = "Is Anonymous"
        case victim = "Victim"
        case perpetrator = "Perpetrator"
        case incidentTime = "Incident Time"
        case incidentPlace = "Incident Place"
        case incidentDetail = "Incident Detail"
    }
}
