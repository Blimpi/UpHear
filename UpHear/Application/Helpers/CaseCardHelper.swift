//
//  CaseCardHelper.swift
//  UpHear
//
//  Created by Meichel Rendio on 30/08/21.
//

import Foundation

struct CaseCardHelper{
    func CaseIDFormat(_ str : Int) -> String{
        let stringID = String(format: "CA%03d", str)
        return stringID
    }
    
    func caseDateFormat(_ str: String) -> String{
        let formatter = DateFormatter()
        let currentDate = formatter.date(from: str)
        formatter.dateFormat = "dd MMMM yyyy"
        let formatedDate = formatter.string(from: currentDate ?? Date())
        return formatedDate
    }
}
