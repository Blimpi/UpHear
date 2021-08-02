//
//  CaseRow.swiftUI.swift
//  UpHear
//
//  Created by Bismo Widianto on 31/07/21.
//

import SwiftUI

struct CaseRow_swiftUI: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                .fill(Color.cardBgColor)
            HStack{
                VStack(alignment: .leading){
                    Text("STATUS")
                        .fontWeight(.bold)
                        .font(Font.system(size:16))
                        .foregroundColor(.primaryColor)
                        .padding(.bottom, 5)
                   
                    Text("Date of Incident")
                        .font(Font.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.subheadline)
                    
                    Text("DATE")
                        .padding(.bottom, 5)
                        .font(Font.system(size: 18))
                        
                    Text("Perpretator Name:")
                        .font(Font.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.subheadline)
                    
                    Text("NAME")
                        .font(Font.system(size: 18))
                    Spacer()
                    
                }.padding()
                Spacer()
                
                Image("chevron")
                    
            }.padding(.horizontal)
        }.frame(height:164)
        .shadow(radius: 7)
        .padding(.horizontal,29)
    }
}


extension Color{
    static let primaryColor = Color("buttonColor")
    static let cardBgColor = Color("cardBgColor")
    static let subheadline = Color("subHeadlineColor")
}

struct CaseRow_swiftUI_Previews: PreviewProvider {
    static var previews: some View {
        CaseRow_swiftUI()
    }
}
