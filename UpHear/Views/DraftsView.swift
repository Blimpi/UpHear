//
//  DraftsView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI


struct Draft: Identifiable{
    var id: Int
    var isAnonymous: Bool
    var victimID: Int
    var perpetratorName: String
    var incidentTime: String
    var incidentDate: String
    var incidentDetails: String
}

struct DraftsView: View {
    
//    let drafts: [Draft] = [
//        .init(id:0, isAnonymous: true, victimID: 01, perpetratorName: "Wimpi", incidentTime: "20:00", incidentDate: "20-July-2021", incidentDetails:"Saya terdiskriminasi banget!"),
//        .init(id:0, isAnonymous: true, victimID: 01, perpetratorName: "Wimpi", incidentTime: "20:00", incidentDate: "20-July-2021", incidentDetails:"Saya terdiskriminasi banget!"),
//        .init(id:0, isAnonymous: true, victimID: 01, perpetratorName: "Wimpi", incidentTime: "20:00", incidentDate: "20-July-2021", incidentDetails:"Saya terdiskriminasi banget!"),
//        .init(id:0, isAnonymous: true, victimID: 01, perpetratorName: "Wimpi", incidentTime: "20:00", incidentDate: "20-July-2021", incidentDetails:"Saya terdiskriminasi banget!"),
//
//  ]
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                List{
                    CaseDraftRow()
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("My Drafts")
        }
    }
}

struct DraftsView_Previews: PreviewProvider {
    static var previews: some View {
        DraftsView()
    }
}



//let dataDraft = [
//    draft(id: 01, isAnonymous: true, victimID: 02, perpetratorName: "Wimpi", incidentTime: "22:00", incidentDate: "27-July-2020", incidentDetails: "Saya terdiskriminasi"),
//
//    draft(id: 02, isAnonymous: false, victimID: 03, perpetratorName: "Wimbu", incidentTime: "21:00", incidentDate: "20-July-2019", incidentDetails: "Saya terdiskriminasi banget"),
//
//    draft(id: 01, isAnonymous: true, victimID: 02, perpetratorName: "Wimpi", incidentTime: "22:00", incidentDate: "27-July-2019", incidentDetails: "Saya terdiskriminasi sedikit")
//]

