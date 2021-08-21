//
//  HRCloseCaseView.swift
//  UpHear
//
//  Created by Bismo Widianto on 20/08/21.
//

import SwiftUI

struct HRCloseCaseView: View {
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    
    @State private var outcome: String = ""
    @State private var details: String = ""
    @State private var alertIsPresented = true
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Group{
                        Image("bgTnC")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 390, height: 60)
                    }.padding(.bottom,16)
                    
                    VStack(alignment:.leading){
                        Group{
                            Text("Outcome")
                                .modifier(headerStyle())
                                
                            
                            
                            TextField("Case Outcome", text: $outcome)
                                .padding()
                                //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 342, height: 44, alignment: .center)
                                .border(Color.gray, width: 2)
                                .cornerRadius(4)
                        }
                        
                        
                        Group{
                            Text("Details")
                                .modifier(headerStyle())
                                
                            
                            TextField(
                                    " ",
                                     text: $details
                            ).frame(width: 335, height: 171)
                            .border(Color.gray, width: 2)
                            .cornerRadius(4)
                        }
                    }
                    
                    //Button
                    Button(action: { }) {
                        Rectangle().fill(Colors.primaryColor)
                            .cornerRadius(8)
                            .frame(width: 334, height:50)
                            .padding(.horizontal, 31).overlay(
                                Text("Close Case")
                                    .accentColor(.white)
                            )
                    }.padding(.top,332)
                    .alert(isPresented: $alertIsPresented, content: {
                        Alert(title: Text("Close this case"),message: Text("By closing this case, you can no longer access it and your decision should be final."), primaryButton:.default(Text("Save")), secondaryButton:.cancel())
                    })
                    
                    Spacer()
                    
                }.padding(.bottom, 24)
//                .padding(.top,-200)
                
            }
            
            
            .navigationTitle("Close Case")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: { }) {
                Image(systemName: "chevron.left").foregroundColor(.white).font(.system(size: 24).weight(.semibold))
            })
        }
    }
    
    
    
}

struct headerStyle :ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(Font.system(size: 16).weight(.semibold))
            .foregroundColor(.buttonColor)
            .padding(.bottom,8)
    }
}

struct HRCloseCaseView_Previews: PreviewProvider {
    static var previews: some View {
        HRCloseCaseView()
    }
}
