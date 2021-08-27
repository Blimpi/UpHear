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
    @Published var currentIndex: Int = 1
    @Published var isAnonymous: Bool = false
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
                    if(index == self.arrayOfEvidenceImage.count-1){
                        let caseItem = Case(reporterID: "", isAnonymous: self.isAnonymous, victimID: "", perpetratorID: "", incidentTime: self.incidentDate, incidentPlace: self.IncidentPlace, incidentDetail: self.description, evidences: self.arrayOfEvidence)
                        
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

extension View {
// This function changes our View to UIView, then calls another function
// to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
// here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
