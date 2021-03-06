//
//  CreateReportViewModel.swift
//  UpHear
//
//  Created by Timothy Ananda on 02/08/21.
//

import Foundation
import SwiftUI
import FirebaseStorage

class CreateReportViewModel: ObservableObject {
    @Published var caseReport: Case = Case()
    @Published var willDismiss: Bool = false
    @Published var currentIndex: Int = 1
    @Published var isAnonymous: Bool = false
    @Published var incidentDate: Date = Date()
    @Published var IncidentPlace: String = ""
    @Published var victim: String = "Enter victim name"
    var victimID: String = ""
    @Published var publication: publicationType = .nothing
    @Published var identity: identityCondition = .nothing
    @Published var offender: String = "Enter offender name"
    var offenderID: String = ""
    var arrayOfEvidence : [String] = []
    @Published var arrayOfEvidenceImage: [UIImage] = []
    @Published var description: String = ""
    let storage = Storage.storage().reference()
    @Published var userDataResponses: [UserDataResponse]?
    
    init() {
        getUserDataResponse()
    }
    
    func addIndex(){
        currentIndex+=1
        if(currentIndex > 6){
            currentIndex = 6
        }
    }
    
    func reduceIndex(){
        currentIndex-=1
        if(currentIndex < 1){
            currentIndex = 1
        }
    }
  
    func addPict(Img: UIImage){
        arrayOfEvidenceImage.append(Img)
    }
    
    func setIdentity(Identity: identityCondition){
        identity = Identity
    }
    
    func setPublication(publicity : publicationType){
        publication = publicity
    }
    
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = "d MMMM y"
        let dateStr = dateFormatter.string(from: incidentDate)
        return dateStr
    }
    
    func getUserName() -> String {
        return UserProfileCache.get().name ?? ""
    }
    
    func getUserDataResponse() {
            AuthRequest.fetchUserData(url: NetworkConstants.USER_URL, header: NetworkConstants.GET_HEADER, showLoader: false) { response in
                print(response)
                
                DispatchQueue.main.async {
                    self.userDataResponses = response.records
                }
            } failCompletion: { message in
                print(message)
            }
    }
    
    func setVictimID(name: String) {
        let userDataResponse = userDataResponses?.first(where: {$0.fields?.name == name})
        victimID = userDataResponse?.id ?? ""
    }
    
    func setOffenderID(name: String) {
        let userDataResponse = userDataResponses?.first(where: {$0.fields?.name == name})
        offenderID = userDataResponse?.id ?? ""
    }
    
    func uploadImageToDatabase(){
        for index in 0..<arrayOfEvidenceImage.count {
            let uiImage = arrayOfEvidenceImage[index]
            guard let imageData = uiImage.pngData() else {
                print("No Data")
                return
                
            }
            
            storage.child("Evidance/file\(index).png").putData(imageData, metadata: nil) {(metadata, error) in
                self.storage.child("Evidance/file\(index).png").downloadURL {(url, error) in
                    guard let url = url else {
                        print("failed upload")
                        return
                    }
                    self.arrayOfEvidence.append(url.absoluteString)
                    print(url.absoluteString)
                                                                             
                    if(self.arrayOfEvidence.count == self.arrayOfEvidenceImage.count){
                        let caseItem = Case(reporterID: UserProfileCache.getId(), isAnonymous: self.publication.rawValue, victimID: self.victimID, perpetratorID: self.offenderID, incidentTime: self.incidentDate, incidentPlace: self.IncidentPlace, incidentDetail: self.description, evidences: self.arrayOfEvidence)
                        
                        CaseRequest.addCase(url: NetworkConstants.CASE_URL, header: NetworkConstants.POST_HEADER, caseItem: caseItem, showLoader: false) { responseData in
                            if responseData.records?.count != 0 {
                                print(responseData)
                            }
                        } failCompletion: { message in
                            print("POST data to server fail with reason: \(message)")
                        }
                    }
                }
            }
        }
    }
}

