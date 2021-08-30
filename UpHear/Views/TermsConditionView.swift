//
//  TermsConditionView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct TermsConditionView: View {
    var body: some View {
        ZStack{
            VStack{
                Image("bgTnC-1")
                    .resizable()
                    .offset(x: 0, y: 0)
                    .frame(width: 390, height: 240)
                Spacer()
            }

            
            VStack{
                Image("imageHeader").padding(.top,40)
                
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(46)
                            .frame(height: 675, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        VStack{
                            Section{ //Modal
                                Section{ //Headers
                                    Text("Agreements")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .font(Font.system(size:22))
                                        .padding(.top,10)
                                    Text("Your agreement is important. Please read the following terms before using UpHear")
                                        .padding(.top)
                                        .font(Font.system(size:16))
                                        .multilineTextAlignment(.center)
                                }

                                Section{ //List Agreements
                                    VStack{
                                        HStack{
                                            Image("tnc1")
                                                
                                            Text("All submitted reports shall be filed under reporter's consent and based on true facts")
                                                .padding(.leading,12)
                                        }.padding(.bottom,30)
                                        
                                        HStack{
                                            Image("tnc2")
                                                
                                            Text("UpHear is a safe place to make a report. Therefore we ensure to protect the confidentiality and anonymity of the reporter's identity")
                                                .padding(.leading,12)
                                        }.padding(.bottom,30)
                                        
                                        HStack{
                                            Image("tnc4")
                                                
                                            Text("UpHear will not disclose any kind of infomration regarding the submitted reports to any parties unrelated to the report")
                                                .padding(.leading,12)
                                        }.padding(.bottom,30)
                                        
                                    }.font(Font.system(size:13))
                                    .padding(.horizontal,43)
                                    .padding(.vertical,37)
                                    
                                    Text("By tapping “Agree to Terms”, you agree to UpHear’s Terms of Service and Privacy Policy.")
                                        .font(Font.system(size:11))
                                        .fontWeight(.light)
                                        .frame(width: 304, height:30, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        
                                    Button(action: {}, label: {
                                        Text("Agree to Terms").font(.body)
                                            
                                    }).frame(width: 335, height: 50, alignment: .center)
                                    .background(Color.buttonColor)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .padding(.bottom,50)
                                    .padding(.top,30)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension Color{
    static let buttonColor = Color("buttonColor")
}

struct TermsConditionView_Previews: PreviewProvider {
    static var previews: some View {
        TermsConditionView()
    }
}
