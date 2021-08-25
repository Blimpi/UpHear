//
//  NewCreateReportPage.swift
//  UpHear
//
//  Created by Meichel Rendio on 24/08/21.
//

import SwiftUI

struct NewCreateReportPage: View {
    @EnvironmentObject var vms: CreateReportViewModel
    var body: some View {
        switch vms.currentIndex {
        case 1:
            firstPage().environmentObject(vms)
        case 2:
            secondPage(vm: vms)
        case 3:
            thirdPage(vm: vms)
        default:
            Text("Out of Index")
        }
    }
}

struct firstPage: View{
    @EnvironmentObject var vm: CreateReportViewModel
    var body: some View{
        ZStack{
            VStack{
                Image("background_report_a_case")
                Spacer()
            }
            VStack{
                modalTopBar(topBarStyle: .white)
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
                OptionCard(title: "Witness", subtitle: "Reporting someone else's discrimination case", icon: "witnessIconBlue", backgroundColor: .white)
                Spacer().frame(height: 27)
                OptionCard(title: "Victim", subtitle: "Someone who experienced discrimination", icon: "victimIconBlue", backgroundColor: .white)        
            }
            VStack{
                Spacer()
                BackNextButton(vm: vm)
                Spacer().frame(height: 20)
            }
        }
    }
}

struct secondPage: View{
    @ObservedObject var vm:CreateReportViewModel
    var body: some View{
        ZStack{
            VStack{
                Image("background_report_a_case")
                Spacer()
            }
            VStack{
                modalTopBar(topBarStyle: .white)
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
                Button(action: {}, label: {
                    OptionCard(title: "Anonymous", subtitle: "Your personal identity will stay as anonymous", icon: "anonymousIconWhite", backgroundColor: .white)
                })
                Spacer().frame(height: 27)
                Button(action: {}, label: {
                    OptionCard(title: "Identified", subtitle: "Your personal identity will be revealed in the report", icon: "identifiedIconWhite", backgroundColor: .white)
                })
            }
            VStack{
                Spacer()
                BackNextButton(vm: vm)
                Spacer().frame(height: 20)
            }
        }
    }
}
struct thirdPage: View{
    @ObservedObject var vm: CreateReportViewModel
    @State var showDatePicker = false
    @State var showVictimPicker = false
    @State var showPerpetratorPicker = false
 
    var body: some View{
        ZStack{
            VStack{
                modalTopBar(topBarStyle: .normal)
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
                        .padding(.leading,15)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                        
                    Spacer().frame(height: 24)
                }
                VStack(alignment: .leading){
                    Text("Victim name")
                    TextField("Enter victim name", text: $vm.victim)
                        .padding(.leading,15)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                    Spacer().frame(height: 24)
                }
                VStack(alignment: .leading){
                    Text("Offender name")
                    TextField("Enter Offender name", text: $vm.offender)
                        .padding(.leading,15)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                }
                VStack{
                    Spacer()
                    BackNextButton(vm: vm)
                }
            }
            .opacity(showDatePicker ? 0 : 1)
            .padding(36)
        }
    }
}
enum TopBarStyle{
    case normal
    case white
}

// reuseable
struct modalTopBar: View{
    @State var topBarStyle:TopBarStyle
    var body: some View{
        HStack{
            Button(action: {}, label: {
                Text("Close")
            })
            .padding()
            
            Spacer()
            
            Text("Report a Case")
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Save")
            })
            .padding()
        }
        .foregroundColor(topBarStyle == .normal ? .none : .white)
    }
}

struct BackNextButton:View{
    @ObservedObject var vm: CreateReportViewModel
    var body: some View{
        VStack{
            Text("\(vm.currentIndex) out of 5")
                .font(.callout)
            HStack{
                Button(action: {
                    vm.reduceIndex()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(Colors.primaryColor,lineWidth: 1)
                            .frame(width: 153, height: 50)
                        Text("Back")
                            .foregroundColor(Colors.primaryColor)
                    }
                })
                
                Button(action: {
                    vm.addIndex()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Colors.primaryColor)
                            .frame(width: 153, height: 50)
                        Text("Next")
                            .foregroundColor(.white)
                    }
                })
            }
        }
    }
}


