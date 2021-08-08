//
//  AuthViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 02/08/21.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    var mainView: UpHearApp
    
    init(mainView: UpHearApp) {
        self.mainView = mainView
    }
    
    func authButtonPressed(mode: authMode, email: String, password: String) {
        if mode == .signIn {
            signIn(email: email, password: password)
        }
        else if mode == .signUp {
            signUp(email: email, password: password)
        }
    }
    
    func signIn(email: String, password: String) {
        if !email.isValidEmail() {
            //invalid email
            return
        }
        
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
                        UserProfileCache.save(user, id: records[0].id!)
                    }
                    self.mainView.isSignedIn = true
                }
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
    func signUp(email: String, password: String) {
        if !email.isValidEmail() {
            //invalid email
            return
        }
        
        let lowercasedEmail = email.lowercased()
        let hashedPassword = password.sha256()
        
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC"
        ]
        
        let url = "https://api.airtable.com/v0/appAre4MVvocsZOpK/tbl6ChR5gz43HU3AB?filterByFormula=%7BEmail%7D+%3D+'\(lowercasedEmail)'"
        
        AuthRequest.fetchUserData(url: url, header: headers, showLoader: false) { response in
            
            if let records = response.records {
                if records.isEmpty {
                    self.registerUser(email: lowercasedEmail, password: hashedPassword)
                    self.signIn(email: lowercasedEmail, password: hashedPassword)
                }
                else {
                    print("Email already registered")
                }
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
    func registerUser(email: String, password: String) {
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let userItem: User = User(email: email, password: password)
        
        userItem.name = ""
        userItem.role = "User"
        userItem.company = ["recvpLKu4YoeV0hiI"]
        
        AuthRequest.addUser(url: NetworkConstants.USER_URL, header: headers, userItem: userItem, showLoader: false) { responseData in
            if responseData.records?.count != 0 {
                print(responseData)
            }
        } failCompletion: { message in
            print("POST data to server fail with reason: \(message)")
        }
    }
    
}

enum authMode {
    case signIn
    case signUp
}
