//
//  EvidanceCell.swift
//  UpHear
//
//  Created by Meichel Rendio on 26/08/21.
//

import SwiftUI


struct EvidanceCell:View{
    var image: Image
    @State var defaultImage: Image = Image("bgLogin")
    var body: some View{
        ZStack{
            image
                .resizable()
                .frame(width: 85, height: 85)
                .clipped()
                .aspectRatio(contentMode: .fit)
            HStack{
                Spacer()
                VStack{
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                    Spacer()
                }
            }
        }
    }
}


