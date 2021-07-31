//
//  ReportSummaryView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct ReportSummaryView: View {
    @State var isIdentityNil = true
    @State var dateOfIncident:Date = Date()
    @State var victimName =  ""
    @State var placeOfIncident = ""
    @State var perpetratorName = ""
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "primaryColor")!]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Rectangle().fill(Color.white).border(Color.gray, width: 3).cornerRadius(8).overlay(
                    List{
                        Text("hello")
                    }
                    
                ).padding(.horizontal,31)
                Button(action: { }) {
                    Rectangle().fill(Color.white).border(Colors.primaryColor, width: 2)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .padding(.horizontal, 31).padding(.top,10).overlay(
                            Text("Save to Draft").accentColor(Colors.primaryColor)
                        )
                }
                Button(action: { }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .padding(.horizontal, 31).overlay(
                            Text("Submit Report").accentColor(.white)
                        )
                }

                
            }.navigationBarTitle(("Report Summary"),displayMode: .inline)
            .navigationBarItems(leading: Button(action: { }) {
                    Image(systemName: "chevron.left")
            }.accentColor(Colors.primaryColor), trailing: Button(action: {}){
                Text("Close")
            })
        }
        
    }
    
}

struct ReportSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ReportSummaryView()
    }
}
