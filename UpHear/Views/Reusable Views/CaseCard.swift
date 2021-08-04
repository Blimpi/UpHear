//
//  CaseRow.swiftUI.swift
//  UpHear
//
//  Created by Bismo Widianto on 31/07/21.
//

import SwiftUI

struct CaseCard: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.cardBgColor)
                .frame(height:164)
                .shadow(color: .black.opacity(0.5), radius:4, x: 0, y: 2)
                .overlay(
                    ZStack{
                        VStack(alignment: .leading){
                            HStack{
                                Text("Need More detail")
                                    .fontWeight(.bold)
                                    .font(Font.system(size:16))
                                    .foregroundColor(.primaryColor)
                                    .padding(.bottom, 5)
                                Spacer()
                                Image(systemName: "exclamationmark.circle.fill")
                                    .font(.system(size: 35).bold())
                                    .foregroundColor(Colors.secondaryColor)
                            }
                            Text("Date of Incident")
                                .font(Font.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.subheadline)
                            
                            Text("20 July 2021")
                                .padding(.bottom, 5)
                                .font(Font.system(size: 18))
                                
                            Text("Perpretator Name:")
                                .font(Font.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.subheadline)
                            
                            Text("Wimpi")
                                .font(Font.system(size: 18))
                            Spacer()
                            
                        }.padding()
                        HStack{
                            Spacer()
                            Image("chevron").padding(.trailing,14)
                        }
                    }
                ).padding(.horizontal)
        }
    }
}


extension Color{
    static let primaryColor = Color("buttonColor")
    static let cardBgColor = Color("cardBgColor")
    static let subheadline = Color("subHeadlineColor")
}

struct CaseRow_swiftUI_Previews: PreviewProvider {
    static var previews: some View {
        CaseCard()
    }
}
