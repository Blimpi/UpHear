//
//  CreateReportViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 02/08/21.
//

import Foundation

class CreateReportViewModel: ObservableObject {
    @Published var caseReport: Case
    
    init() {
        caseReport = Case()
    }
}
