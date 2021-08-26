//
//  ForthPage.swift
//  UpHear
//
//  Created by Meichel Rendio on 26/08/21.
//

import SwiftUI

struct forthPage: View {
    @ObservedObject var vm: CreateReportViewModel
    var body: some View{
        ZStack{
            VStack{
                modalTopBar(topBarStyle: .normal)
                Spacer()
            }
            VStack(alignment: .leading){
                Text("Discrimination Detail")
                    .font(.title)
                    .bold()
                    .foregroundColor(Colors.primaryColor)
                    .padding(.bottom,36)
                    
                Text("Tell us more about the discrimination that happened to you and why you think it was a discriminatory action.")
                    .font(
                        .system(size: 16).weight(.semibold)
                    )
                    .foregroundColor(Colors.primaryColor)
                TextEditor(text: $vm.description)
                    .border(Colors.primaryColor, width: 2)
                    .frame(height: 296)
                Spacer()
                
            }
            .padding(.horizontal,36)
            .padding(.top, 106)
            VStack{
                Spacer()
                BackNextButton(vm: vm)
                Spacer().frame(height: 20)
            }
        }
    }
}
