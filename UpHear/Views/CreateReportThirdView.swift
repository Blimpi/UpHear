//
//  CreateReportThirdView.swift
//  UpHear
//
//  Created by Meichel Rendio on 30/07/21.
//

import SwiftUI

struct CreateReportThirdView: View {
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
            ZStack{
                Rectangle().fill(Colors.primaryColor).cornerRadius(46).padding(.init(top: 37, leading: 23, bottom: 0, trailing: 23))
                VStack{
                    Spacer().frame(height: 97)
                    Rectangle().fill(Color.white).cornerRadius(46).overlay(
                        VStack(alignment: .leading){
                            Spacer().frame(height:41)
                            VStack(alignment: .leading){
                                Text("Date and time of incident").font(.system(size: 16))
                                TextField(
                                        "  Enter date and time of incident",
                                         text: $placeOfIncident
                                ).frame(height:45)
                                .border(Color.gray, width: 2)
                                .cornerRadius(4)
                                .padding(.trailing,23)
                                
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
                            
//                            HStack{
//                                DatePicker(selection: $dateOfIncident, in: ...Date(), displayedComponents: .date) {
//                                }
//                                Spacer()
//                                Spacer()
//                            }
                            
                            Text("").frame(maxWidth: .infinity)
                            Spacer()
                            Button(action: { }) {
                                Rectangle().fill(Colors.primaryColor)
                                    .cornerRadius(8)
                                    .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                                    .padding(.horizontal, 23).overlay(
                                        Text("Next").accentColor(.white)
                                    )
                            }
                            //Spacer().frame(height:69)
                        }
                    )
                }
                
                HStack(alignment: .center, spacing: 32){
                    VStack{
                        Text("1").padding(.init(top: 49, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.white).font(.body)
                        RoundedRectangle(cornerRadius: 3).fill(Color.white).frame(width: 34, height: 6, alignment: .center)
                        Spacer()
                    }
                    
                    VStack{
                        Text("2").padding(.init(top: 49, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.white).font(.body)
                        RoundedRectangle(cornerRadius: 3).fill(Color.white).frame(width: 34, height: 6, alignment: .center)
                        Spacer()
                    }
                    
                    VStack{
                        Text("3").padding(.init(top: 49, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.white).font(.body)
                        RoundedRectangle(cornerRadius: 3).fill(Color.white).frame(width: 34, height: 6, alignment: .center)
                        Spacer()
                    }
                    
                    VStack{
                        Text("4").padding(.init(top: 49, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.white).font(.body)
                        RoundedRectangle(cornerRadius: 3).fill(Color.white).frame(width: 34, height: 6, alignment: .center)
                        Spacer()
                    }
                }
                
                
                
            }.navigationBarTitle(("Report a Case"),displayMode: .inline)
            .navigationBarItems(leading: Button(action: { }) {
                    Image(systemName: "chevron.left")
            }.accentColor(Colors.primaryColor), trailing: Button(action: {}){
                Text("Close")
            })
        }
        
    }
}

struct CreateReportThirdView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReportThirdView()
    }
}
