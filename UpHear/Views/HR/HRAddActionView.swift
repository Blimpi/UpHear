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
    @State private var details: String = "Describe the action"
    @State private var isRequiredResponse: Bool = true
    @State private var isRequiredSubmitFile: Bool = true
    @State private var date = Date()
    
    @State var showDatePicker = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    VStack{
                        Image("bgTnC")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 390, height: 40)
                        Spacer()
                        
                        ZStack{
                            
                            VStack{
                                DatePicker("", selection: $date, displayedComponents: [.date]).datePickerStyle(GraphicalDatePickerStyle())
                                Button(action: {
                                    showDatePicker = false
                                }, label: {
                                    Text("Done")
                                })
                            }
                            .padding(40)
                            .opacity(showDatePicker ? 1 : 0)
                            
                            VStack{
                                VStack(alignment: .leading){
                                    Text("Action Title")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primaryColor)
                                        .font(Font.system(size: 16))
                                    
                                    TextField("Enter title of action", text: $actionTitle)
                                        .padding(.leading,16)
                                        .frame(width: 342, height: 44, alignment: .center)
                                        .border(Colors.primaryColor, width: 2)
                                        .cornerRadius(4)
                                }.padding(.top,16)
                                
                                VStack(alignment: .leading){
                                    Text("Details")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primaryColor)
                                        .font(Font.system(size: 16))
                                        .padding(.bottom, -2)
                                    
                                    TextField(
                                        " ",
                                        text: $details
                                        
                                    ).padding(.leading,16)
                                    .frame(width: 342, height: 171, alignment: .leading)
                                    .border(Color.primaryColor, width: 2)
                                    .cornerRadius(4)
                                }.padding(.top,16)
                                
                                VStack(alignment: .leading){
                                    Text("Action Estimation Deadline")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primaryColor)
                                        .font(Font.system(size: 16))
                                    
                                    Button(action: {
                                        showDatePicker = true
                                    }, label: {
                                        HStack{
                                            Text("\(date)")
                                                .foregroundColor(Colors.customGray)
                                                .multilineTextAlignment(.leading)
                                                .padding()
                                            Spacer()
                                        }
                                    }).frame(maxWidth: 342, maxHeight: 45)
                                    .background(Color.white)
                                    .border(Color.primaryColor, width: 2)
                                    .cornerRadius(4)
                                    Spacer().frame(height: 24)
                                    
                                    
                                }.padding(.top,16)
                                
                                
                                HStack{
                                    Text("Required response")
                                        .padding(.leading,16)
                                    Spacer()
                                    Toggle("Sound", isOn: $isRequiredResponse)
                                        .labelsHidden()
                                        .padding()
                                }.frame(width: 342, height: 44, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(lineWidth: 2)
                                        .foregroundColor(.primaryColor)
                                ).padding(.top,40)
                                
                                
                                HStack{
                                    Text("Required submit file")
                                        .padding()
                                    Spacer()
                                    Toggle("Sound", isOn: $isRequiredSubmitFile)
                                        .labelsHidden()
                                        .padding()
                                }
                                .frame(width: 342, height: 44, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(lineWidth: 2)
                                        .foregroundColor(.primaryColor)
                                )
                                .padding(.top,16)
                                
                                Button(action: { }) {
                                    Rectangle().fill(Colors.primaryColor)
                                        .cornerRadius(8)
                                        .frame(width: 342, height:50)
                                        .padding(.horizontal, 31).overlay(
                                            Text("Add Action")
                                                .accentColor(.white)
                                        )
                                }.padding(.top,60)
                                Spacer()
                            }.opacity(showDatePicker ? 0 : 1)
                            
                        }
                        .navigationTitle("TITLE")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(leading: Button(action: { }) {
                            Image(systemName: "chevron.left").foregroundColor(.white).font(.system(size: 24).weight(.semibold))
                        })
                    }
                }
            }
        }
    }
}

struct HRAddActionView_Previews: PreviewProvider {
    static var previews: some View {
        HRAddActionView()
    }
}
