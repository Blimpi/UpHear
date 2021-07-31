//
//  Company.swift
//  UpHear
//
//  Created by Timothy Ananda on 31/07/21.
//

import Foundation

struct Company: Codable {
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}
