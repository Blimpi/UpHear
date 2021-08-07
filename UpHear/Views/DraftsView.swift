//
//  DraftsView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct DraftsView: View {
    
//    let drafts: [Draft] = [
//        .init(id:0, isAnonymous: true, victimID: 01, perpetratorName: "Wimpi", incidentTime: "20:00", incidentDate: "20-July-2021", incidentDetails:"Saya terdiskriminasi banget!"),
//        .init(id:0, isAnonymous: true, victimID: 01, perpetratorName: "Wimpi", incidentTime: "20:00", incidentDate: "20-July-2021", incidentDetails:"Saya terdiskriminasi banget!"),
//        .init(id:0, isAnonymous: true, victimID: 01, perpetratorName: "Wimpi", incidentTime: "20:00", incidentDate: "20-July-2021", incidentDetails:"Saya terdiskriminasi banget!"),
//        .init(id:0, isAnonymous: true, victimID: 01, perpetratorName: "Wimpi", incidentTime: "20:00", incidentDate: "20-July-2021", incidentDetails:"Saya terdiskriminasi banget!"),
//
//  ]
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    var body: some View {
        
        NavigationView{
            ZStack{
                ZStack{
                    
                    List{
                        Spacer()
                        CaseDraftRow()
                    }.listStyle(PlainListStyle())
                    VStack{
                        Image("navBarBG").ignoresSafeArea()
                        Spacer()
                    }
                    
                }
                .navigationBarTitle(("Draft Case"),displayMode: .inline)
                .navigationBarItems(leading: Button(action: { }) {
                    Image(systemName: "chevron.left").accentColor(.white).font(.system(size: 24).weight(.semibold))
                })
            }
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

