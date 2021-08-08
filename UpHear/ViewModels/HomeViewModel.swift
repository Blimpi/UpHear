//
//  HomeViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 06/08/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var caseData: CaseData = CaseData(records: [])
    
    init() {
        loadCases()
    }
    
    func loadCases() {
        let headers = [
            "Authorization": "Bearer keyNHgPpNaQW4eEMC"
        ]
        
        CaseRequest.fetchCaseData(url: NetworkConstants.CASE_URL, header: headers, showLoader: false) { response in
            print(response)
            
            DispatchQueue.main.async {
                self.caseData = response
            }
        } failCompletion: { message in
            print(message)
        }
    }
}
