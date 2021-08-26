//
//  HRActionCard.swift
//  UpHear
//
//  Created by Bismo Widianto on 06/08/21.
//

import SwiftUI

struct HRActionCard: View {
    
    @State var actionTitle: String = "Ask For More Evidence"
    @State var date: String = "12/11/2021"
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.cardBgColor)
                .shadow(radius: 7)
            HStack{
                VStack(alignment: .leading){
                    //Text("Case \(kasus.id)").font(.largeTitle)
                    Text(actionTitle)
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                        .font(Font.system(size: 17))
                    
                    HStack{
                        Text("Due Date: ")
                        Text(date)
                    }.foregroundColor(.subheadline)
                    .font(Font.system(size: 12))
                }
                Spacer()
                
                Image(systemName: "exclamationmark.circle.fill")
                    .font(.system(size: 35).bold())
                    .foregroundColor(Color.yellow)
            }.padding()
            
        }.frame(width: 326, height:69)
        
        
    }
    
}

struct HRActionCard_Previews: PreviewProvider {
    static var previews: some View {
        HRActionCard()
    }
}
