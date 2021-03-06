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
        if !email.isValidEmail() {
            //invalid email
            return
        }
        
        let lowercasedEmail = email.lowercased()
        let hashedPassword = password.sha256()
        
        if mode == .signIn {
            signIn(email: lowercasedEmail, password: hashedPassword)
        }
        else if mode == .signUp {
            signUp(email: lowercasedEmail, password: hashedPassword)
        }
    }
    
    func signIn(email: String, password: String) {
        
        let url = "https://api.airtable.com/v0/appAre4MVvocsZOpK/tbl6ChR5gz43HU3AB?filterByFormula=AND(%7BEmail%7D+%3D+'\(email)'%2C%7BPassword%7D+%3D+'\(password)')"
        
        AuthRequest.fetchUserData(url: url, header: NetworkConstants.GET_HEADER, showLoader: false) { response in
            
            if let records = response.records {
                if records.isEmpty {
                    print("login failed")
                }
                else {
                    if let user = records[0].fields {
                        UserProfileCache.save(user, id: records[0].id!)
                    }
                    SignInCache.save(true)
                    self.mainView.isSignedIn = true
                }
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
    func signUp(email: String, password: String) {
        
        let url = "https://api.airtable.com/v0/appAre4MVvocsZOpK/tbl6ChR5gz43HU3AB?filterByFormula=%7BEmail%7D+%3D+'\(email)'"
        
        AuthRequest.fetchUserData(url: url, header: NetworkConstants.GET_HEADER, showLoader: false) { response in
            
            if let records = response.records {
                if records.isEmpty {
                    self.registerUser(email: email, password: password)
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
        
        let userItem: User = User(email: email, password: password)
        
        userItem.name = email.components(separatedBy: "@")[0].capitalized
        userItem.role = "User"
        userItem.company = ["recvpLKu4YoeV0hiI"]
        
        AuthRequest.addUser(url: NetworkConstants.USER_URL, header: NetworkConstants.POST_HEADER, userItem: userItem, showLoader: false) { responseData in
            if responseData.records?.count != 0 {
                print(responseData)
            }
            self.signIn(email: email, password: password)
        } failCompletion: { message in
            print("POST data to server fail with reason: \(message)")
        }
    }
    
}

enum authMode {
    case signIn
    case signUp
}
