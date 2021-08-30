//
//  FirstPage.swift
//  UpHear
//
//  Created by Meichel Rendio on 26/08/21.
//

import SwiftUI

struct firstPage: View{
    @ObservedObject var vm: CreateReportViewModel

    var body: some View{
        ZStack{
            VStack{
                Image("background_report_a_case")
                Spacer()
            }
            VStack{
                modalTopBar(vm: vm,topBarStyle: .white)
                VStack(alignment:.leading){
                    Text("Who are you reporting as?")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Spacer().frame(height:16)
                    Text("Do you consider your self as a victim or witness in this discrimination case?")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal,36)
                .padding(.top,36)
                Spacer()
            }
            VStack{
                Button(action: {
                    vm.setIdentity(Identity: .victim)
                }, label: {
                    if(vm.identity == .victim){
                        OptionCard(title: "Victim", subtitle: "Someone who experienced discrimination", icon: "victimIconBlue_def", isSelected: .selected)
                    }else{
                        OptionCard(title: "Victim", subtitle: "Someone who experienced discrimination", icon: "victimIconBlue_def", isSelected: .unselected)
                    }
                })
                Spacer().frame(height: 27)
                Button(action: {
                    vm.setIdentity(Identity: .witness)
                }, label: {
                    if(vm.identity == .witness){
                        OptionCard(title: "Witness", subtitle: "Reporting someone else's discrimination case", icon: "witnessIconBlue_def", isSelected: .selected)
                    }else{
                        OptionCard(title: "Witness", subtitle: "Reporting someone else's discrimination case", icon: "witnessIconBlue_def", isSelected: .unselected)
                    }
                })
            }
            VStack{
                Spacer()
                BackNextButton(vm: vm).opacity(vm.identity == .nothing ? 0 : 1)
                Spacer().frame(height: 20)
            }
        }
    }
}
