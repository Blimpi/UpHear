//
//  ThirdPage.swift
//  UpHear
//
//  Created by Meichel Rendio on 26/08/21.
//

import SwiftUI

struct thirdPage: View{
    @ObservedObject var vm: CreateReportViewModel
    @State var showDatePicker = false
 
    var body: some View{
        ZStack{
            VStack{
                modalTopBar(vm: vm,topBarStyle: .normal)
                Spacer()
            }
            VStack{
                DatePicker("", selection: $vm.incidentDate, displayedComponents: [.date]).datePickerStyle(GraphicalDatePickerStyle())
                Button(action: {
                    showDatePicker = false
                }, label: {
                    Text("Done")
                })
            }
            .padding(40)
            .opacity(showDatePicker ? 1 : 0)
            
            
            VStack(alignment: .leading){
                Text("Discrimination Detail")
                    .font(.title)
                    .bold()
                    .foregroundColor(Colors.primaryColor)
                    .padding(.bottom,36)
                    .padding(.top, 66)
                VStack(alignment: .leading){
                    Text("Date and time of incident")
                    Button(action: {
                        showDatePicker = true
                    }, label: {
                        HStack{
                            Text("\(vm.incidentDate)")
                                .foregroundColor(Colors.customGray)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Spacer()
                        }
                    }).frame(maxWidth: .infinity, maxHeight: 45)
                    .background(Color.white)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    Spacer().frame(height: 24)
                }
                VStack(alignment: .leading){
                    Text("Place of Incident")
                    TextField("Enter place of incident", text: $vm.IncidentPlace)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                    Spacer().frame(height: 24)
                }
                VStack(alignment: .leading){
                    Text("Victim name")
                    TextField("Enter victim name", text: $vm.victim)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                    Spacer().frame(height: 24)
                }
                VStack(alignment: .leading){
                    Text("Offender name")
                    TextField("Enter Offender name", text: $vm.offender)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                }
                
            }
            .opacity(showDatePicker ? 0 : 1)
            .padding(.top,36)
            .padding(.horizontal,36)
        }
        VStack{
            Spacer()
            BackNextButton(vm: vm)
            Spacer().frame(height: 20)
        }
    }
}
