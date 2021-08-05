//
//  User.swift
//  UpHear
//
//  Created by Timothy Ananda on 30/07/21.
//

import Foundation

struct UserData: Codable {
    let records: [UserDataResponse]?
}

struct UserDataResponse: Codable, Identifiable {
    let id: String?
    let fields: User?
    let createdTime: String?
}

class User: Codable {
    var email: String
    var password: String
    var name: String
    var role: String
    var company: [String]
    var companyName: [String]
    var position: String
    var division: String
    
    enum CodingKeys: String, CodingKey {
        case email = "Email"
        case password = "Password"
        case name = "Name"
        case role = "Role"
        case company = "Company"
        case companyName = "Name (from Company)"
        case position = "Position"
        case division = "Division"
    }
    
    init() {
        email = ""
        password = ""
        name = ""
        role = ""
        company = [""]
        companyName = [""]
        position = ""
        division = ""
    }
}
