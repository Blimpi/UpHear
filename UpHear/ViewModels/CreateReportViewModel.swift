//
//  CreateReportViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 02/08/21.
//

import Foundation
import SwiftUI

class CreateReportViewModel: ObservableObject {
    @Published var caseReport: Case
    @Published var currentIndex: Int = 1
    @Published var incidentDate: Date = Date()
    @Published var IncidentPlace: String = ""
    @Published var victim: String = ""
    @Published var offender: String = ""
    @Published var arrayOfEvidence : [String] = []
    
    init() {
        caseReport = Case()
    }
    
    func addIndex(){
        currentIndex+=1
        if(currentIndex > 5){
            currentIndex = 5
        }
    }
    
    func reduceIndex(){
        currentIndex-=1
        if(currentIndex < 1){
            currentIndex = 1
        }
}
