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
            {"records":[{"fields": {"CaseID": "\(caseItem.caseID ?? 0)","Reporter": ["\(caseItem.reporterID?[0] ?? "")"],"Evidences": "\(caseItem.evidences ?? "")","isAnonymous": "\(caseItem.isAnonymous ?? APIbool.f.rawValue)","Victim": ["\(caseItem.victimID?[0] ?? "")"],"Perpetrator": ["\(caseItem.perpetratorID?[0] ?? "")"],"IncidentTime": "\(caseItem.incidentTime ?? "")","IncidentPlace": "\(caseItem.incidentPlace ?? "")","IncidentDetail": "\(caseItem.incidentDetail ?? "")","Status": "\(caseItem.status ?? caseStatus.waiting.rawValue)"}}]}
        """
        
        BaseRequest.POST(url: url, header: header, jsonString: jsonString, showLoader: showLoader) { response in
            
            var dataModel = DataManager.CASEDATA
            
            do {
                let newCase = try JSONDecoder().decode(CaseData.self, from: response as! Data)
                dataModel = newCase
                successCompletion(dataModel!)
            } catch let error {
                print("Error: \(error)")
            }
            
        } failCompletion: { message in
            print("Error: \(message)")
        }
    }
    
}
