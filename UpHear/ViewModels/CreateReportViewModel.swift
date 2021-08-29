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
    @Published var incidentDate: Date = Date()
    @Published var IncidentPlace: String = ""
    @Published var victim: String = ""
    @Published var publication: publicationType = .nothing
    @Published var identity: identityCondition = .nothing
    @Published var offender: String = ""
    var arrayOfEvidence : [String] = []
    @Published var arrayOfEvidenceImage: [UIImage] = []
    @Published var description: String = ""
    let storage = Storage.storage().reference()
    
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
                        // upload to airtable
                    }
                }
            }
        }
    }
}

