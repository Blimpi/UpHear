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
    
    func login(email: String, password: String) {
        //let hashedPassword = password hashed
        
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC"
        ]
        
        let url = "https://api.airtable.com/v0/appAre4MVvocsZOpK/tbl6ChR5gz43HU3AB?fields%5B%5D=&filterByFormula=%7BEmail%7D+%3D+'\(email)'"
        
        AuthRequest.fetchUserData(url: url, header: headers, showLoader: false) { response in
            
            if verifyCredentials(email: email) {
                
            }
            
            UserDefaults.standard.set(email, forKey: Constants.UserDefaults.currentUser)
        } failCompletion: { message in
            print(message)
        }
    }
    
    private func verifyCredentials(email: String) -> Bool {
        
        
        return false
    }
    
}
