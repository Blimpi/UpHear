//
//  Case.swift
//  UpHear
//
//  Created by Bismo Widianto on 29/07/21.
//

import Foundation

struct Case: Hashable, Codable, Identifiable{
    var id: Int
    var isAnonymous: Bool
    var victimID: Int
    var perpetratorName: String
    var incidentTime: String
    var incidentDate: String
    var incidentDetails: String
}

