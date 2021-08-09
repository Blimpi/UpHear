//
//  HomeViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 06/08/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    var caseData: CaseData = CaseData(records: [])
    
    @Published var ongoingCases: [CaseDataResponse] = []
    @Published var closedCases: [CaseDataResponse] = []
    
    init() {
        if let currentUser = UserProfileCache.get() {
            if currentUser.role == userRole.hr.rawValue {
                loadCases()
            }
            else {
                loadUserCases(userName: currentUser.name)
            }
        }
        
//        filterCases()
    }
    
    func loadCases() {
        CaseRequest.fetchCaseData(url: NetworkConstants.CASE_URL, header: NetworkConstants.GET_HEADER, showLoader: false) { response in
            print(response)
            
            DispatchQueue.main.async {
                self.caseData = response
                self.filterCases()
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
    func loadUserCases(userName: String) {
        let url = "https://api.airtable.com/v0/appAre4MVvocsZOpK/tblsvePFzoics161o?filterByFormula=ARRAYJOIN(%7BName+(from+Reporter)%7D%2C+%22%22)+%3D+'\(userName)'"
        
        CaseRequest.fetchCaseData(url: url, header: NetworkConstants.GET_HEADER, showLoader: false) { response in
            print(response)
            
            DispatchQueue.main.async {
                self.caseData = response
                self.filterCases()
            }
        } failCompletion: { message in
            print(message)
        }
    }
    
    func filterCases() {
        if let records = caseData.records {
            fillOngoingCases(records: records)
            fillClosedCases(records: records)
        }
    }
    
    func fillOngoingCases(records: [CaseDataResponse]) {
        ongoingCases = []
        
        for caseItem in records {
            if caseItem.fields?.status != caseStatus.closed.rawValue {
                ongoingCases.append(caseItem)
            }
        }
    }
    
    func fillClosedCases(records: [CaseDataResponse]) {
        closedCases = []
        
        for caseItem in records {
            if caseItem.fields?.status == caseStatus.closed.rawValue {
                closedCases.append(caseItem)
            }
        }
    }
}
