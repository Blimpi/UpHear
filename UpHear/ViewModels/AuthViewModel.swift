//
//  AuthViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 02/08/21.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    init() {
        //
    }
    
    func authButtonPressed(mode: authMode, email: String, password: String) {
        if mode == .signIn {
//            signIn(email: email, password: password)
        }
        else if mode == .signUp {
//            signUp(email: email, password: password)
        }
    }
    
    func signIn(email: String, password: String) {
        let lowercasedEmail = email.lowercased()
        let hashedPassword = password.sha256()
        
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC"
        ]
        
        let url = "https://api.airtable.com/v0/appAre4MVvocsZOpK/tbl6ChR5gz43HU3AB?filterByFormula=AND(%7BEmail%7D+%3D+'\(lowercasedEmail)'%2C%7BPassword%7D+%3D+'\(hashedPassword)')"
        
        AuthRequest.fetchUserData(url: url, header: headers, showLoader: false) { response in
            
            if let records = response.records {
                if records.isEmpty {
                    print("login failed")
                }
                else {
                    if let user = records[0].fields {
                        UserProfileCache.save(user)
                    }
                }
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
    func signUp(email: String, password: String) {
        let lowercasedEmail = email.lowercased()
//        let hashedPassword = password.sha256()
        
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC"
        ]
        
        let url = "https://api.airtable.com/v0/appAre4MVvocsZOpK/tbl6ChR5gz43HU3AB?filterByFormula=%7BEmail%7D+%3D+'\(lowercasedEmail)'"
        
        AuthRequest.fetchUserData(url: url, header: headers, showLoader: false) { response in
            
            if let records = response.records {
                if records.isEmpty {
                    //post
                }
                else {
                    print("Email already ")
                }
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
}

enum authMode {
    case signIn
    case signUp
}
