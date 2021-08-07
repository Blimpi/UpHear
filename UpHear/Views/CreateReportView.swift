//
//  CreateReportView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct CreateReportView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: CreateReportViewModel = CreateReportViewModel()
    @State var identityType: identityCondition = .nothing
    @State var isAnonym: publicationType = .nothing
    @State var showAlert = false
    @State var isVictim: Bool?
    @State var currentPage = 4
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
                    CreateReportPage(page: $currentPage,isVictim: $isVictim, isButtonSelect: $identityType, isAnonym: $isAnonym, birthdate: Date(), vm: viewModel)
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
enum identityCondition: Int {
    case victim = 1
    case witness = 2
    case nothing = 0
}
enum publicationType{
    case anonymous
    case identified
    case nothing
}

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
                    vm.caseReport?.isAnonymous = false
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
                    vm.caseReport?.isAnonymous = true
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
    //                    TextField(
    //                            "  Enter date and time of incident",
    //                             text: $placeOfIncident
    //                    ).frame(height:45)
    //                    .border(Color.gray, width: 2)
    //                    .cornerRadius(4)
    //                    .padding(.trailing,23)
                        testPicker()
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


