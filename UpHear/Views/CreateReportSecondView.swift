//
//  CreateReportSecondView.swift
//  UpHear
//
//  Created by Meichel Rendio on 30/07/21.
//

import SwiftUI

struct CreateReportSecondView: View {
    
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
                        VStack{
                            Spacer().frame(height:43)
                            Text("Select Publication Type").font(.title2.weight(.bold))
                            grayText(content: "Do you consider yourself as a victim or witness in this discrimination case?", size: 17, weight: .medium).multilineTextAlignment(.center)
                                .padding(.init(top: 15, leading: 36, bottom: 0, trailing: 36))
                            Spacer().frame(height: 49)
                            Button(action: { }) {
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
                            }.opacity(isIdentityNil ? 0 : 1)
                            
                        }
                    )
                }
                CustomPageControl(pageNumber: 2)
  
            }.navigationBarTitle(("Report a Case"),displayMode: .inline)
            .navigationBarItems(leading: Button(action: {}) {
                    Image(systemName: "chevron.left")
            }.accentColor(Colors.primaryColor), trailing: Button(action: {}){
                Text("Close")
            })
        }
        
    }
}

struct CreateReportSecondView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReportSecondView()
    }
}
