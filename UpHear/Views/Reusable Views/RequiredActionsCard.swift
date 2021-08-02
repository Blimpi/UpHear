//
//  RequiredActionsCardswift.swift
//  UpHear
//
//  Created by Meichel Rendio on 02/08/21.
//

import SwiftUI

struct RequiredActionsCard: View {
    var body: some View {
        Rectangle()
            .fill(Colors.cardBackground)
            .frame(width: 323, height: 69)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.5), radius: 4, x: 0.0, y: 2)
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Text("Need more evidence").font(.custom("SF Pro Text", size: 15))
                        Text("Need more evidence").font(.custom("SF Pro Text", size: 12)).foregroundColor(Colors.customGray)
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "exclamationmark.circle.fill").font(.system(size: 35)).foregroundColor(Colors.secondaryColor)
                        Spacer().frame(width:-10)
                        Image(systemName: "plus.circle.fill").font(.system(size: 35)).foregroundColor(Colors.primaryColor)
                    }
                }.padding()
                
            )
    }
}

struct RequiredActionsCard_Previews: PreviewProvider {
    static var previews: some View {
        RequiredActionsCard()
    }
}
