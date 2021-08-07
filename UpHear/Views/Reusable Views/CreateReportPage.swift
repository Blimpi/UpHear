//
//  CreateReportPage.swift
//  UpHear
//
//  Created by Meichel Rendio on 07/08/21.
//

import SwiftUI

struct CreateReportPage:View{
    @Binding var page:Int
    @Binding var isVictim:Bool?
    @Binding var isButtonSelect:identityCondition
    @Binding var isAnonym: publicationType
    @State var isButtonShow = false
    @State var placeOfIncident = "adasdas ad asdasdasd asd asd asdasd asd asdas dasdas das das dasd as dasd asd as dasd asd as dasd asd asd asd asd asd asd asd asd asd asd as das dasd asd asd asdazs asd asd asd asd asd as dad sdadasdasdasdasda sdad asd asd asd asd asdasd asadsar gtqdaS GASD GAD GS "
    @State var birthdate:Date
    @State var vm: CreateReportViewModel
    var body: some View{
        if (page==1){
            VStack{
                Spacer().frame(height:43)
                Text("Select Identity Type").font(.title2.weight(.bold))
                grayText(content: "Do you consider yourself as a victim or witness in this discrimination case?", size: 17, weight: .medium)
                    .multilineTextAlignment(.center)
                    .padding(.init(top: 15, leading: 36, bottom: 0, trailing: 36))
                Spacer().frame(height: 49)
                Button(action: {
                    isButtonSelect = .victim
                    page+=1
                }) {
                    if(isButtonSelect != .victim){
                        Image("Victim_Card").renderingMode(.original)
                    }else{
                        Image("bgTnC").renderingMode(.original)
                    }
                    
                }
                Button(action: {
                        isButtonSelect = .witness
                        page+=1})
                {
                    if(isButtonSelect != .witness){
                        Image("Witness_Card").renderingMode(.original)
                    }else{
                        Image("bgTnC").renderingMode(.original)
                    }
                }
                Spacer()
                Spacer()
                Button(action: {
                        page+=1
                    
                }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .padding(.horizontal, 23).overlay(
                            Text("Next").accentColor(.white)
                        )
                }.opacity(isButtonSelect == .nothing ? 0 : 1)
            }
        }else if(page == 2){
            VStack{
                Spacer().frame(height:43)
                Text("Select Publication Type").font(.title2.weight(.bold))
                grayText(content: "Do you consider yourself as a victim or witness in this discrimination case?", size: 17, weight: .medium).multilineTextAlignment(.center)
                    .padding(.init(top: 15, leading: 36, bottom: 0, trailing: 36))
                Spacer().frame(height: 49)
                Button(action: {
                    isAnonym = .identified
                    vm.caseReport?.isAnonymous = "false"
                    page+=1
                }) {
                    if(isAnonym != .identified){
                        Image("Identified_Card").renderingMode(.original)
                    }else{
                        Image("bgTnC").renderingMode(.original)
                    }
                    
                }
                Button(action: {
                    isAnonym = .anonymous
                    vm.caseReport?.isAnonymous = "true"
                    page+=1
                }) {
                    if(isAnonym != .anonymous){
                        Image("Anonymous_Card").renderingMode(.original)
                    }else{
                        Image("bgTnC").renderingMode(.original)
                    }
                }
                Spacer()
                Spacer()
                Button(action: {
                    page+=1
                }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .padding(.horizontal, 23).overlay(
                            Text("Next").accentColor(.white)
                        )
                }.opacity(isAnonym == .nothing ? 0 : 1)
            }
        }else if(page == 3){
            
            VStack(alignment: .leading){
                Spacer().frame(height:41)
                VStack(alignment: .leading){
                    VStack(){
                        Text("Date and time of incident").font(.system(size: 16))
                        TextField(
                                "  Enter date and time of incident",
                                 text: $placeOfIncident
                        ).frame(height:45)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                        .padding(.trailing,23)
                        //testPicker()
                    }
                    
                    
                    Text("Place of incident").font(.system(size: 16))
                    
                    TextField(
                            "  Enter place of incident",
                             text: $placeOfIncident
                    ).frame(height:45)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.trailing,23)
                    
                    Text("Victim Name").font(.system(size: 16))
                    
                    TextField(
                            "  Enter victim name",
                             text: $placeOfIncident
                    ).frame(height:45)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.trailing,23)
                    
                    Text("Perpetrator Name").font(.system(size: 16))
                    TextField(
                            "  Enter perpretator Name",
                             text: $placeOfIncident
                    ).frame(height:45)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.trailing,23)
                }.padding(.leading,42)
                
                Text("").frame(maxWidth: .infinity)
                Spacer()
                
                Button(action: {
                    page+=1
                }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .padding(.horizontal, 23).overlay(
                            Text("Next").accentColor(.white)
                        )
                }
            }
        }else if(page == 4){
            VStack(alignment: .leading){
                Spacer().frame(height:41)
                VStack(alignment: .leading){
                    Text("Please describe the incident in detail").font(.system(size: 16))
                    TextEditor(
                             text: $placeOfIncident
                    ).frame(height:255)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.trailing,23)

                    Text("Incident Evidance").font(.system(size: 16)).padding(.top,22).padding(.bottom,16)
                    HStack{
                        Button(action: { }) {
                            Image("Add_Incident_Button").renderingMode(.original)
                        }
                        // collection view
                        
                    }
                    
                }.padding(.leading, 27)
                
                Text("").frame(maxWidth: .infinity)
                Spacer()
                
                NavigationLink(
                    destination: ReportSummaryView().navigationBarBackButtonHidden(true),
                    label: {
                        Rectangle().fill(Colors.primaryColor)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                            .padding(.horizontal, 23).overlay(
                                Text("Next").accentColor(.white)
                            )
                    })
            }
        }
    }
}



