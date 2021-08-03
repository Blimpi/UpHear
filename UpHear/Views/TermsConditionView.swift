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
            Rectangle()
                .fill(Color.buttonColor)
                .ignoresSafeArea()
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
                                            Text("Reporters are responsible for all submitted reports")
                                        }.padding(.bottom,30)
                                        
                                        HStack{
                                            Image("tnc2")
                                            Text("All submitted reports shall be filed based on true facts and only the truth. There will be consequences shall it be filed falsely")
                                        }.padding(.bottom,30)
                                        
                                        HStack{
                                            Image("tnc3")
                                            Text("HR holds the authority to process the reports. UpHear does not have the authority to make decisions or to take any actions regarding the submitted")
                                        }.padding(.bottom,30)
                                        
                                        HStack{
                                            Image("tnc4")
                                            Text("UpHear ensures to protect the confidentiality of reporter's identity, and is not responsible if HR may need to disclose reporter's identity if necessary.")
                                        }
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
