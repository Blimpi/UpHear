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
    @State var placeOfIncident = ""
    @State var birthdate:Date
    @State var vm: CreateReportViewModel
    @State var showDatePicker = false
    @State var showVictimPicker = false
    @State var showPerpetratorPicker = false
    @State var victimPickerInitialValue = "Select Victim Names"
    @State var perpetratorPickerInitialValue = "Select Offender Name"
    @State var victim:String = "Wimpi1"
    @State var perpetrator = "Mung"
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
            ZStack{
                VStack{
                    DatePicker("", selection: $birthdate, displayedComponents: [.date]).datePickerStyle(GraphicalDatePickerStyle())
                    Button(action: {
                        showDatePicker = false
                    }, label: {
                        Text("Done")
                    })
                }.padding(40)
                .opacity(showDatePicker ? 1 : 0)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            showVictimPicker = false
                        }, label: {
                            Text("Done")
                        }).padding(.trailing,32)
                    }
                    Spacer().frame(height: 32)
                    Picker(selection: $victim, label: Text("Picker"), content: {
                        Text("Wimpi").tag("Wimpi1")
                        Text("Mung").tag("Mung1")
                        Text("Mango").tag("Mango1")
                        Text("Wimpi").tag("Wimpi2")
                        Text("Mung").tag("Mung2")
                        Text("Mango").tag("Mango2")
                    }).frame(height: 150).animation(.none)
                }.ignoresSafeArea()
                .opacity(showVictimPicker ? 1 : 0)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            showPerpetratorPicker = false
                        }, label: {
                            Text("Done")
                        }).padding(.trailing,32)
                    }
                    Spacer().frame(height: 32)
                    Picker(selection: $perpetrator, label: Text("Picker"), content: {
                        Text("Wimpi").tag(1)
                        Text("Mung").tag(2)
                        Text("Mango").tag(3)
                        Text("Wimpi").tag(4)
                        Text("Mung").tag(5)
                        Text("Mango").tag(6)
                    }).frame(height: 150).animation(.none)
                    
                }.ignoresSafeArea()
                .opacity(showPerpetratorPicker ? 1 : 0)
                
                VStack(alignment: .leading){
                    Spacer().frame(height:41)
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Date and time of incident").font(.system(size: 16))
                            Button(action: {
                                showDatePicker = true
                            }, label: {
                                HStack{
                                    Text("Enter date and time of incident")
                                        .foregroundColor(Colors.customGray)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                    Spacer()
                                }       
                            }).frame(maxWidth: .infinity, maxHeight: 45)
                            .background(Color.white)
                            .border(Color.gray, width: 2)
                            .cornerRadius(4)
                            .padding(.trailing,23)
                        }
                        VStack(alignment: .leading){
                            Text("Place of incident")
                            TextField(
                                    "  Enter place of incident",
                                     text: $placeOfIncident
                            ).frame(height:45)
                            .border(Color.gray, width: 2)
                            .cornerRadius(4)
                            .padding(.trailing,23)
                        }
                        VStack(alignment: .leading){
                            Text("Victim").font(.system(size: 16))
                            Button(action: {
                                showVictimPicker = true
                                victimPickerInitialValue = victim
                            }, label: {
                                HStack{
                                    Text("\(victimPickerInitialValue)")
                                        .foregroundColor(Colors.customGray)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                    Spacer()
                                }
                            }).frame(maxWidth: .infinity, maxHeight: 45)
                            .background(Color.white)
                            .border(Color.gray, width: 2)
                            .cornerRadius(4)
                            .padding(.trailing,23)
                        }
                        VStack(alignment: .leading){
                            Text("Offender").font(.system(size: 16))
                            Button(action: {
                                showPerpetratorPicker = true
                                perpetratorPickerInitialValue = perpetrator
                            }, label: {
                                HStack{
                                    Text("\(perpetratorPickerInitialValue)")
                                        .foregroundColor(Colors.customGray)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                    Spacer()
                                }
                            }).frame(maxWidth: .infinity, maxHeight: 45)
                            .background(Color.white)
                            .border(Color.gray, width: 2)
                            .cornerRadius(4)
                            .padding(.trailing,23)
                        }
                    }.padding(.leading,42)
                    
                    Text("").frame(maxWidth: .infinity)
                    Spacer()
                    
                    Button(action: {
                        page+=1
                        vm.caseReport?.incidentTime = "\(birthdate)"
                        vm.caseReport?.perpetratorName = perpetratorPickerInitialValue
                    }) {
                        Rectangle().fill(Colors.primaryColor)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                            .padding(.horizontal, 23).overlay(
                                Text("Next").accentColor(.white)
                            )
                    }
                }.opacity(!showDatePicker && !showVictimPicker && !showPerpetratorPicker ? 1 : 0)
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



