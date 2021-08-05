//
//  CreateReportView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct CreateReportView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var isIdentityNil = true
    @State var currentPage = 4
    @State var showAlert = false
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
                    CreateReportPage(page: $currentPage, isButtonShow: isIdentityNil)
                    
                )
            }
            CustomPageControl(pageNumber: $currentPage)
        }.navigationBarTitle(("Report a Case"),displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(
            action: {
                if(currentPage == 1){
                    self.presentationMode.wrappedValue.dismiss()
                }else{
                    currentPage = currentPage - 1
                }
            })
        {
            Image(systemName: "chevron.left")
        }.accentColor(Colors.primaryColor), trailing: Button(action: {
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
//        .alert(isPresented: $showAlert, content: {
//            Alert(title: Text("Unsaved report"), message: Text("Are you sure want to discard this report? Your information will be lost."), primaryButton: .default(Text("Save to Draft"), action: {
//                .alert
//                Alert(title: Text("Saved to draft"), dismissButton: .default(Text("OK")))
//            }), secondaryButton: .destructive(Text("Discard")))
//        })
        }
    }
}


struct CreateReportPage:View{
    @Binding var page:Int
    @State var isButtonShow = false
    @State var placeOfIncident = ""
    @ObservedObject var viewModel: CreateReportViewModel = CreateReportViewModel()
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
                    
                    page+=1
                }) {
                    Image("Victim_Card").renderingMode(.original)
                }
                Button(action: { page+=1}) {
                    Image("Witness_Card").renderingMode(.original)
                }
                Spacer()
                Spacer()
                Button(action: { }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .padding(.horizontal, 23).overlay(
                            Text("Next").accentColor(.white)
                        )
                }.opacity(isButtonShow ? 0 : 1)
            }
        }else if(page == 2){
            VStack{
                Spacer().frame(height:43)
                Text("Select Publication Type").font(.title2.weight(.bold))
                grayText(content: "Do you consider yourself as a victim or witness in this discrimination case?", size: 17, weight: .medium).multilineTextAlignment(.center)
                    .padding(.init(top: 15, leading: 36, bottom: 0, trailing: 36))
                Spacer().frame(height: 49)
                Button(action: {
                    //viewModel.caseReport?.isAnonymous = false
                }) {
                    Image("Identified_Card").renderingMode(.original)
                }
                Button(action: { }) {
                    Image("Anonymous_Card").renderingMode(.original)
                }
                Spacer()
                Spacer()
                Button(action: { }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .padding(.horizontal, 23).overlay(
                            Text("Next").accentColor(.white)
                        )
                }.opacity(isButtonShow ? 0 : 1)
            }
        }else if(page == 3){
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
                Button(action: { }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .padding(.horizontal, 23).overlay(
                            Text("Next").accentColor(.white)
                        )
                }
            }
        }
    }
}


struct CreateReportView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReportView()
    }
}


