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


struct User: Codable {
    let Email: String?
    let Role: String?
    let Name: String?
    let Company: [String]?
    let Password: String?
    
//    enum CodingKeys: String, CodingKey {
//        case email = "Email"
//        case password = "Password"
//        case name = "Name"
//        case role = "Role"
//        case company = "Company"
//    }
}
