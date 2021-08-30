//
//  secondPage.swift
//  UpHear
//
//  Created by Meichel Rendio on 26/08/21.
//

import SwiftUI

struct secondPage: View{
    @ObservedObject var vm:CreateReportViewModel
    var body: some View{
        ZStack{
            VStack{
                Image("background_report_a_case")
                Spacer()
            }
            VStack{
                modalTopBar(vm: vm,topBarStyle: .white)
                VStack(alignment:.leading){
                    Text("How do you want to report?")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Spacer().frame(height:16)
                    Text("Do you want to disclose your identity or want to stay anonymous?")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal,36)
                .padding(.top,36)
                Spacer()
            }
            VStack{
                Button(action: {
                    vm.setPublication(publicity: .anonymous)
                }, label: {
                    if(vm.publication == .anonymous){
                        OptionCard(title: "Anonymous", subtitle: "Your personal identity will stay as anonymous", icon: "anonymousIconBlue_def", isSelected: .selected)
                    }else{
                        OptionCard(title: "Anonymous", subtitle: "Your personal identity will stay as anonymous", icon: "anonymousIconBlue_def", isSelected: .unselected)
                    }
                    
                })
                Spacer().frame(height: 27)
                Button(action: {
                    vm.setPublication(publicity: .identified)
                }, label: {
                    if(vm.publication == .identified){
                        OptionCard(title: "Identified", subtitle: "Your personal identity will be revealed in the report", icon: "identifiedIconBlue_def", isSelected: .selected)
                    }else{
                        OptionCard(title: "Identified", subtitle: "Your personal identity will be revealed in the report", icon: "identifiedIconBlue_def", isSelected: .unselected)
                    }
                })
            }
            VStack{
                Spacer()
                BackNextButton(vm: vm).opacity(vm.publication == .nothing ? 0 : 1)
                Spacer().frame(height: 20)
            }
        }
    }
}
