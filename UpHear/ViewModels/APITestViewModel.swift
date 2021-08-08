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
        
//        testPost()
    }
    
    func loadData() {
        
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC"
        ]
        
        AuthRequest.fetchUserData(url: NetworkConstants.USER_URL, header: headers, showLoader: false) { response in
            print(response)
            
            DispatchQueue.main.async {
                self.userData = response
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
    func testPost() {
        let newCase = Case()
        
//        newCase.caseID = "CA123"
        newCase.reporterID = ["recu46CkJGzJ7kapn"]
        newCase.isAnonymous = "false"
        newCase.victimID = ["recu46CkJGzJ7kapn"]
        newCase.perpetratorID = ["recu46CkJGzJ7kapn"]
        newCase.incidentTime = "2021-07-30T12:19:34.000Z"
        newCase.incidentPlace = "Kantor"
        newCase.incidentDetail = "qwerty"
        
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        CaseRequest.addCase(url: NetworkConstants.CASE_URL, header: headers, caseItem: newCase, showLoader: false) { responseData in
            if responseData.records?.count != 0 {
                print(responseData)
            }
        } failCompletion: { message in
            print("POST data to server fail with reason: \(message)")
        }
    }
}
