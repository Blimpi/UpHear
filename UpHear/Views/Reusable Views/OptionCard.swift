//
//  OptionCard.swift
//  UpHear
//
//  Created by Meichel Rendio on 18/08/21.
//

import SwiftUI

struct OptionCard: View {
    @State var title = "Victim"
    @State var subtitle = "Someone subjects you to a detriment in this discrimination case"
    @State var icon = "cameraIcon"
    var backgroundColor = Color(red: 225/255, green: 231/255, blue: 245/255)
    
    
    var body: some View {
        Rectangle()
            .fill(backgroundColor)
            .frame(width: 326, height: 88)
            .cornerRadius(15)
            .shadow(color:  .black, radius: 4, x: 0, y: 2)
            .overlay(
                HStack{
                    ZStack{
                        Circle()
                            .frame(width: 51, height: 51, alignment: .center)
                            .foregroundColor(Colors.lightBlue)
                            .overlay(
                                Image(icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45, height: 45)
                            ).clipped()
                    }
                    
                    VStack(alignment: .leading){
                        Text("\(title)")
                            .fontWeight(.semibold)
                            .foregroundColor(.primaryColor)
                            .font(
                                .system(size: 17)
                                .weight(.semibold)
                            )
                            
                        
                        Text("\(subtitle)")
                            .font(
                            .system(size: 12)
                            .weight(.regular))
                            .frame(height: 40)
                            .foregroundColor(.black)
    
                        Text("").frame(maxWidth: .infinity, maxHeight: 0)
                    }
                }.padding()
                
            )
    }
}

struct OptionCard_Previews: PreviewProvider {
    static var previews: some View {
        OptionCard()
    }
}
