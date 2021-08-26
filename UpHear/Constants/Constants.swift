//
//  Constants.swift
//  UpHear
//
//  Created by Timothy Ananda on 28/07/21.
//

import Foundation


struct Constants {
    
    struct UserDefaults {
        static let currentUser = "currentUser"
    }
    
}

enum APIbool: String {
    case t = "true"
    case f = "false"
}

enum identityCondition: Int {
    case victim = 1
    case witness = 2
    case nothing = 0
}
enum publicationType: String{
    case anonymous = "Anonymous"
    case identified = "Identified"
    case nothing = "nil"
}
enum optionCardCondition{
    case selected
    case unselected
}
