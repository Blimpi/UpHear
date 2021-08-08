//
//  UserProfileViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 03/08/21.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User = User()
    
    @Published var name = ""
    @Published var position = ""
    @Published var division = ""
    
    init() {
        loginUser()
        
        getUserData()
        
        setupFields()
    }
    
    func loginUser() {
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC"
        ]
        
        let url = "https://api.airtable.com/v0/appAre4MVvocsZOpK/tbl6ChR5gz43HU3AB?filterByFormula=AND(%7BEmail%7D+%3D+'wimpi@wumbo.com'%2C%7BPassword%7D+%3D+'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e')"
        
        AuthRequest.fetchUserData(url: url, header: headers, showLoader: false) { response in
            
            if let records = response.records {
                if records.isEmpty {
                    print("login failed")
                }
                else {
                    if let user = records[0].fields {
                        UserProfileCache.save(user, id: records[0].id!)
                    }
                }
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
    func getUserData() {
        self.user = UserProfileCache.get()
    }
    
    func setupFields() {
        name = user.name
        position = user.position
        division = user.division
    }
    
    func logout() {
        UserProfileCache.remove()
    }
}
