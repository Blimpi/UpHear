//
//  HRAddActionView.swift
//  UpHear
//
//  Created by Bismo Widianto on 06/08/21.
//

import SwiftUI

struct HRAddActionView: View {
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    @State private var actionTitle: String = ""
    @State private var details: String = "ak;sjda;skjdaslkdjaslkdj asd asd asd asd asd asd as"
    @State private var isRequiredResponse: Bool = true
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("bgTnC")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 390, height: 20)
                    Spacer()
                }
                
                VStack{
                    VStack(alignment: .leading){
                        Text("Action Title")
                            .fontWeight(.semibold)
                            .foregroundColor(.primaryColor)
                            .font(Font.system(size: 16))
                            .padding(.bottom,-2)
                            
                        
                        TextField("Enter title of action", text: $actionTitle)
                            .padding()
    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 342, height: 44, alignment: .center)
                            .border(Colors.primaryColor, width: 1)
                            .cornerRadius(4)
                    }.padding(.bottom, 24)
                    .padding(.top,-80)
                    
                    VStack(alignment: .leading){
                        Text("Details")
                            .fontWeight(.semibold)
                            .foregroundColor(.primaryColor)
                            .font(Font.system(size: 16))
                            .padding(.bottom, -2)
                        
//                            TextField("Enter title of action", text: $details)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .frame(width: 342, height: 44, alignment: .center)
                        
                        TextField(
                                " ",
                            text: $details
                        ).frame(width: 335, height: 171)
                        .border(Color.primaryColor, width: 1)
                        .cornerRadius(4)
                        
                        
                    }.padding(.bottom, 24)
                    
                    VStack(alignment: .leading){
                        Text("Action Estimation Deadline")
                            .fontWeight(.semibold)
                            .foregroundColor(.primaryColor)
                            .font(Font.system(size: 16))
                            .padding(.bottom,-2)
                        
                        TextField("Enter Date", text: $actionTitle)
                            .padding()
    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 342, height: 44, alignment: .center)
                            .border(Colors.primaryColor, width: 1)
                            .cornerRadius(4)
                    }.padding(.bottom, 33)
                    
                    HStack{
                        Text("Required response")
                            .padding()
                        Spacer()
                        Toggle("Sound", isOn: $isRequiredResponse)
                            .labelsHidden()
                            .padding()
                    }.frame(width: 342, height: 44, alignment: .center)
                    .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.primaryColor)
                            )
                    .padding(.bottom,16)
                    
                    HStack{
                        Text("Required submit file")
                            .padding()
                        Spacer()
                        Toggle("Sound", isOn: $isRequiredResponse)
                            .labelsHidden()
                            .padding()
                    }
                    .frame(width: 342, height: 44, alignment: .center)
                    .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.primaryColor)
                            )
                    
                    
                    Button(action: { }) {
                        Rectangle().fill(Colors.primaryColor)
                            .cornerRadius(8)
                            .frame(width: 334, height:50)
                            .padding(.horizontal, 31).overlay(
                                Text("Add Action")
                                    .accentColor(.white)
                            )
                    }
                }
            }
            
            
            .navigationTitle("TITLE")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: { }) {
                Image(systemName: "chevron.left").foregroundColor(.white).font(.system(size: 24).weight(.semibold))
            })
        }
    }
}

struct HRAddActionView_Previews: PreviewProvider {
    static var previews: some View {
        HRAddActionView()
    }
}
