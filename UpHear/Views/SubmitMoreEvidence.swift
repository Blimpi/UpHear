//
//  SubmitMoreEvidence.swift
//  UpHear
//
//  Created by Meichel Rendio on 02/08/21.
//

import SwiftUI

struct SubmitMoreEvidence: View {
    
    @State var description = ""
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("bgTnC")
                        .ignoresSafeArea()
                    Spacer()
                }
                VStack{
                    Spacer().frame(height:40)
                    Rectangle().fill(Color.white).overlay(
                        
                        VStack(alignment: .leading){
                            Text("Status")
                                .font(.system(size: 16))
                                .padding(.top, 16)
                                .padding(.bottom, 10)
                                .foregroundColor(.subheadline)
                            
                            Text("Need more evidence")
                                .padding(.leading,16)
                                .frame(width: 335, height: 44, alignment: .leading)
                                .background(
                                    Rectangle().stroke()
                                        .cornerRadius(4)
                                        .border(Color.gray, width: 1)
                                        .background(Color.white)
                                )
                                
                            Text("Details")
                                .padding(.bottom, 10)
                                .font(.system(size: 16))
                                .padding(.top, 15)
                                .foregroundColor(.subheadline)
                            
                            Text("Please upload more evidence")
                                .padding(.leading,16)
                                .frame(width: 335, height: 44, alignment: .leading)
                                .background(
                                    Rectangle().stroke()
                                        .cornerRadius(4)
                                        .border(Color.gray, width: 1)
                                        .background(Color.white)
                                )
                            
                            
                            Text("Respond to HR")
                                .font(.system(size: 16))
                                .padding(.top, 21)
                                .foregroundColor(.subheadline)
                            
                            TextField(
                                    " ",
                                     text: $description
                            ).frame(width: 335, height: 171)
                            .border(Color.gray, width: 1)
                            .cornerRadius(4)
                            .padding(.trailing,23)
                            
                            Spacer()
                            
                        }
                    )
                    Button(action: { }) {
                        Rectangle().fill(Colors.primaryColor)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                            .padding(.horizontal, 31).overlay(
                                Text("Submit").accentColor(.white)
                            )
                    }
                }
                
            }.navigationTitle("Submit Actions")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: { }) {
                Image(systemName: "chevron.left").foregroundColor(.white).font(.system(size: 24).weight(.semibold))
            })
        }
    }
}

struct SubmitMoreEvidence_Previews: PreviewProvider {
    static var previews: some View {
        SubmitMoreEvidence()
    }
}
