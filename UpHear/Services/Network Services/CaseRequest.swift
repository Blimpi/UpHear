//
//  CaseRequest.swift
//  UpHear
//
//  Created by Timothy Ananda on 04/08/21.
//

import Foundation

class CaseRequest: NSObject {
    
    static func fetchCaseData(url: String,
                              header: [String: String],
                              showLoader: Bool,
                              successCompletion: @escaping (CaseData) -> Void,
                              failCompletion: @escaping (String) -> Void) {
        BaseRequest.GET(url: url, header: header, showLoader: showLoader) {
            response in
            
            var dataModel = DataManager.CASEDATA
            
            do {
                let caseModel = try JSONDecoder().decode(CaseData.self, from: response as! Data)
                dataModel = caseModel
                successCompletion(dataModel!)
            } catch let error {
                print("error reading json file: \(error.localizedDescription)")
            }
            
        }
    }
    
    static func addCase(url: String,
                        header: [String: String],
                        caseItem: Case,
                        showLoader: Bool,
                        successCompletion: @escaping (CaseData) -> Void,
                        failCompletion: @escaping (String) -> Void) {
        
        let jsonString = """
            {"records":[{"fields": {"CaseID": "\(caseItem.caseID)","Reporter": ["\(caseItem.reporterID)"],"isAnonymous": "\(caseItem.isAnonymous)","Victim": ["\(caseItem.victimID)"],}}]}
        """
//        
//        BaseRequest.POST(url: url, header: header, jsonString: jsonString, showLoader: showLoader, successCompletion: , failCompletion: )
    }
    
}
