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
    @State var currentPage = 1
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



struct CreateReportView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReportView()
    }
}


