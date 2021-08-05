//
//  CustomPageControl.swift
//  UpHear
//
//  Created by Meichel Rendio on 04/08/21.
//

import SwiftUI

struct CustomPageControl: View{
    @Binding var pageNumber: Int
    var body: some View{
        HStack(alignment: .center, spacing: 32){
            ForEach((1...4), id: \.self) {i in
                if pageNumber == i {
                    VStack{
                        Text("\(i)").padding(.init(top: 49, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Colors.secondaryColor).font(.body)
                        RoundedRectangle(cornerRadius: 3).fill(Colors.secondaryColor).frame(width: 34, height: 6, alignment: .center)
                        Spacer()
                    }
                }else{
                    VStack{
                        Text("\(i)").padding(.init(top: 49, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color.white).font(.body)
                        RoundedRectangle(cornerRadius: 3).fill(Color.white).frame(width: 34, height: 6, alignment: .center)
                        Spacer()
                    }
                }
            }
        }
    }
}

