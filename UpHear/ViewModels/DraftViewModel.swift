//
//  DraftViewModel.swift
//  UpHear
//
//  Created by Bismo Widianto on 30/08/21.
//

import Foundation
import CoreData

class DraftViewModel: ObservableObject{
    
    let container: NSPersistentContainer
    @Published var savedEntities: [Draft] = []
    
    
    init(){
        container = NSPersistentContainer(name: "UpHear")
        container.loadPersistentStores{(description, error) in
            if let error = error {
                print("Error loading Core Data.\(error)")
            }else{
                print("Successfully Loaded from Core Data")
            }
        }
        fetchDraft()
    }
    
    
    func fetchDraft(){
        let request = NSFetchRequest<Draft>(entityName: "Draft")
        
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch let error{
            print ("Error Fetching. \(error)")
        }
        
    }
    
    func addDraft(casedID : String, incidentDetail: String, incidentPlace: String, incidentTime: String , isAnonymous : String, perpetratorID: String,perpetratorName : String, reporterID : String, reporterName : String, victimID: String, victimName: String){
        
        let newDraft = Draft(context: container.viewContext)
        
        newDraft.caseID = casedID
        newDraft.incidentDetail = incidentDetail
        newDraft.incidentPlace = incidentPlace
        newDraft.incidentTime = incidentTime
        newDraft.isAnonymous = isAnonymous
        newDraft.perpetratorID = perpetratorID
        newDraft.perpetratorName = perpetratorName
        newDraft.reporterID = reporterID
        newDraft.reporterName = reporterName
        newDraft.victimID = victimID
        newDraft.victimName = victimName
    }
    
    func saveDraft(){
        do{
            try container.viewContext.save()
            fetchDraft()
        }catch let error{
            print("Error Saving.\(error)")
        }
    }
}
