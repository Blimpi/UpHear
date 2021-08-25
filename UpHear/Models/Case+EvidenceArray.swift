//
//  Case+EvidenceArray.swift
//  UpHear
//
//  Created by Timothy Ananda on 25/08/21.
//

import Foundation

extension Case {
    func getEvidenceArray() -> [String] {
        if let evidenceStr = evidences {
            let evidenceArr = evidenceStr.components(separatedBy: " ")
            
            return evidenceArr
        }
        
        return [""]
    }
    
    func setEvidenceArray(evidenceArr: [String]) {
        var evidenceStr = ""
        
        for evidence in evidenceArr {
            evidenceStr += evidence
        }
        
        self.evidences = evidenceStr
    }
}
