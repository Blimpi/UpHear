//
//  APITestViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 01/08/21.
//

import Foundation

class APITestViewModel: ObservableObject {
    @Published var userData: UserData?
    
    init() {
        loadData()
//        print(userData!)
    }
    
    func loadData() {
        
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC"
        ]
        
        Auth.fetchUserData(url: NetworkConstant.GET_USERS_LIST, header: headers, showLoader: false) { response in
            print(response)
            
            self.userData = response
        } failCompletion: { message in
            print(message)
        }
    }
}
