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
                    ScrollView(.vertical){
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("identity Type").font(.system(size: 14))
                                summaryText("Victim")
                                Spacer().frame(height: 11)
                            }
                            VStack(alignment: .leading){
                                Text("Publications Type").font(.system(size: 14))
                                summaryText("Identified")
                                Spacer().frame(height: 11)
                            }
                            VStack(alignment: .leading){
                                Text("Date and Time of Incident").font(.system(size: 14))
                                summaryText("27 July 2021 - 08:00 AM")
                                Spacer().frame(height: 11)
                            }
                            VStack(alignment: .leading){
                                Text("Place of Incident").font(.system(size: 14))
                                summaryText("Meeting Room")
                                Spacer().frame(height: 11)
                            }
                            VStack(alignment: .leading){
                                Text("Victim Name").font(.system(size: 14))
                                summaryText("Exol")
                                Spacer().frame(height: 11)
                            }
                            VStack(alignment: .leading){
                                Text("Perpretator Name").font(.system(size: 14))
                                summaryText("Army")
                                Spacer().frame(height: 11)
                            }
                            VStack(alignment: .leading){
                                Text("Please describe the incident in detail").font(.system(size: 14))
                                Text("As a women in this workplace, I got gender discrimination. Working mothers still make less money than their male colleagues, regardless of credentials and experience, and female workers are often penalized for taking time off to give birth, bond with their child, or receive prenatal care.").font(.system(size: 15).weight(.medium))
                                Spacer().frame(height: 11)
                            }
                            VStack(alignment: .leading){
                                Text("Incident Evidence")
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
                            Text("Save to Draft").accentColor(Colors.primaryColor)
                        )
                }.padding(.horizontal, 31).padding(.top,10)
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
