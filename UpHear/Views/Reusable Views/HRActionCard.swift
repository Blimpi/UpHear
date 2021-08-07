//
//  HRActionCard.swift
//  UpHear
//
//  Created by Bismo Widianto on 06/08/21.
//

import SwiftUI

struct HRActionCard: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.cardBgColor)
            HStack{
                VStack(alignment: .leading){
                    //Text("Case \(kasus.id)").font(.largeTitle)
                    Text("Ask For More Evidence")
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                        .font(Font.system(size: 17))
                    
                    HStack{
                        Text("Due Date: ")
                        Text("12/11/2021")
                    }.foregroundColor(.subheadline)
                    .font(Font.system(size: 12))

                    
                }
                Spacer()

                Image(systemName: "paperplane.circle.fill")
                    .font(.system(size: 35).bold())
                    .foregroundColor(Colors.primaryColor)
                
            }.padding()

        }.frame(width: 326, height:69)
        .shadow(radius: 7)
        
    }
    
}

struct HRActionCard_Previews: PreviewProvider {
    static var previews: some View {
        HRActionCard()
    }
}
