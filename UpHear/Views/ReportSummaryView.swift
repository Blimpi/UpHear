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
    @State var showAlert = false
    @State var victimName =  ""
    @State var placeOfIncident = ""
    @State var perpetratorName = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let summaryHeader:LocalizedStringKey = "Report Summary"
    let identityHeader:LocalizedStringKey = "Identity Type"
    let publicationHeader:LocalizedStringKey = "Publications Type"
    let dateTimeHeader:LocalizedStringKey = "Date and time of Incident"
    let placeHeader:LocalizedStringKey = "Place of Incident"
    let victimHeader:LocalizedStringKey = "Victim Name"
    let offenderHeader:LocalizedStringKey = "Offender Name"
    let descHeader:LocalizedStringKey = "Please describe the incident in detail"
    let evidenceHeader: LocalizedStringKey = "Incident Evidence"
    
    let buttonSave:LocalizedStringKey = "Save to Draft"
    let buttonSubmit:LocalizedStringKey = "Submit Report"
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "primaryColor")!]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Rectangle()
                        .fill(Color.white)
                        .border(Color.gray, width: 3)
                        .cornerRadius(8)
                        .overlay(
                            ScrollView(.vertical){
                                VStack(alignment: .leading){
                                    VStack(alignment: .leading){
                                        Text(identityHeader).font(.system(size: 14))
                                        summaryText("Victim")
                                        Spacer().frame(height: 11)
                                    }
                                    VStack(alignment: .leading){
                                        Text(publicationHeader).font(.system(size: 14))
                                        summaryText("Identified")
                                        Spacer().frame(height: 11)
                                    }
                                    VStack(alignment: .leading){
                                        Text(dateTimeHeader).font(.system(size: 14))
                                        summaryText("27 July 2021 - 08:00 AM")
                                        Spacer().frame(height: 11)
                                    }
                                    VStack(alignment: .leading){
                                        Text((placeHeader)).font(.system(size: 14))
                                        summaryText("Meeting Room")
                                        Spacer().frame(height: 11)
                                    }
                                    VStack(alignment: .leading){
                                        Text(victimHeader).font(.system(size: 14))
                                        summaryText("Exol")
                                        Spacer().frame(height: 11)
                                    }
                                    VStack(alignment: .leading){
                                        Text(offenderHeader).font(.system(size: 14))
                                        summaryText("Army")
                                        Spacer().frame(height: 11)
                                    }
                                    VStack(alignment: .leading){
                                        Text(descHeader).font(.system(size: 14))
                                        Text("As a women in this workplace, I got gender discrimination. Working mothers still make less money than their male colleagues, regardless of credentials and experience, and female workers are often penalized for taking time off to give birth, bond with their child, or receive prenatal care.").font(.system(size: 15).weight(.medium))
                                        Spacer().frame(height: 11)
                                    }
                                    VStack(alignment: .leading){
                                        Text(evidenceHeader)
                                        HStack{
                                            Image("Add_Incident_Button").renderingMode(.original)
                                        }
                                        Spacer().frame(height: 11)
                                    }
                                    
                                    Text("").frame(maxWidth: .infinity)
                                }.padding(.init(top: 16, leading: 21, bottom: 16, trailing: 21))
                                
                            }.padding(.bottom,5).clipped()
                    ).padding(.horizontal,31)
                    
                    Button(action: { }) {
                        Rectangle().fill(Color.white).border(Colors.primaryColor, width: 2)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                            .overlay(
                                Text(buttonSave).accentColor(Colors.primaryColor)
                            )
                    }.padding(.horizontal, 31).padding(.top,10)
                    
                    Button(action: { }) {
                        Rectangle().fill(Colors.primaryColor)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                            .padding(.horizontal, 31).overlay(
                                Text(buttonSubmit).accentColor(.white)
                            )
                    }
                }.navigationBarTitle((summaryHeader),displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                        Image(systemName: "chevron.left")
                }

                .accentColor(Colors.primaryColor), trailing: Button(action: {
                    showAlert.toggle()
                }){
                    Text("Close")
                }).actionSheet(isPresented: $showAlert, content: {
                    .init(title: Text("Unsaved report"), message: Text("Are you sure want to discard this report? Your information will be lost."), buttons: [
                        .default(Text("Save to draft")),
                        .destructive(Text("Discard")),
                        .cancel()
                    ])
                })
            }
        }
        }
            
}

struct ReportSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ReportSummaryView()
    }
}
