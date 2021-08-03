//
//  CreateReportView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct CreateReportView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isIdentityNil = true;
    
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
                    CreateReportPage(page: 1, isButtonShow: isIdentityNil)
                )
            }
            CustomPageControl(pageNumber: 1)
        }.navigationBarTitle(("Report a Case"),displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
            Image(systemName: "chevron.left")
        }.accentColor(Colors.primaryColor), trailing: Button(action: {}){
            Text("Close")
        })
        }
    }
}

struct CustomPageControl: View{
    @State var pageNumber = 0
    var body: some View{
        HStack(alignment: .center, spacing: 32){
            ForEach((1...4), id: \.self) {i in
                if pageNumber == i {
                    VStack{
                        Text("\(i)").padding(.init(top: 49, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Colors.secondaryColor).font(.body)
                        RoundedRectangle(cornerRadius: 3).fill(Colors.secondaryColor).frame(width: 34, height: 6, alignment: .center)
                        Spacer()
                    }
                }else{
                    VStack{
                        Text("\(i)").padding(.init(top: 49, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color.white).font(.body)
                        RoundedRectangle(cornerRadius: 3).fill(Color.white).frame(width: 34, height: 6, alignment: .center)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CreateReportPage:View{
    @State var page = 0
    @State var isButtonShow = false
    var body: some View{
        if (page==1){
            VStack{
                Spacer().frame(height:43)
                Text("Select Identity Type").font(.title2.weight(.bold))
                grayText(content: "Do you consider yourself as a victim or witness in this discrimination case?", size: 17, weight: .medium)
                    
                    .multilineTextAlignment(.center)
                    .padding(.init(top: 15, leading: 36, bottom: 0, trailing: 36))
                Spacer().frame(height: 49)
                Button(action: { }) {
                    Image("Victim_Card").renderingMode(.original)
                }
                Button(action: { }) {
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
        }
    }
}


struct CreateReportView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReportView()
    }
}


