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
        
//        testPost()
    }
    
    func loadData() {
        
        AuthRequest.fetchUserData(url: NetworkConstants.USER_URL, header: NetworkConstants.GET_HEADER, showLoader: false) { response in
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
        
        CaseRequest.addCase(url: NetworkConstants.CASE_URL, header: NetworkConstants.POST_HEADER, caseItem: newCase, showLoader: false) { responseData in
            if responseData.records?.count != 0 {
                print(responseData)
            }
        } failCompletion: { message in
            print("POST data to server fail with reason: \(message)")
        }
    }
}
