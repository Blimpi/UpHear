//
//  NetworkConstants.swift
//  UpHear
//
//  Created by Timothy Ananda on 31/07/21.
//

import Foundation

class NetworkConstants: NSObject {
    static let USER_URL = "https://api.airtable.com/v0/appAre4MVvocsZOpK/Users"
    static let CASE_URL = "https://api.airtable.com/v0/appAre4MVvocsZOpK/Cases"
    
    static let GET_HEADER = [
        "Authorization": "Bearer keyNHgPpNaQW4eEMC"
    ]
    static let POST_HEADER = [
        "Authorization": "Bearer keyNHgPpNaQW4eEMC",
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
}
