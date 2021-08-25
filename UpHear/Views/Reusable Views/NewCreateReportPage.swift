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
    //Localized Strings
    let lsPg1Header : LocalizedStringKey = "Who are you reporting as?"
    let lsPg1Desc : LocalizedStringKey = "Do you consider yourself as a victim or witness in this discrimination?"
    let lsVictim = NSLocalizedString("Victim", comment: "Korban")
    let lsVictimDesc = NSLocalizedString("Someone who experienced discrimination", comment: "Orang yang mengalami diskriminasi")
    let lsWitness = NSLocalizedString("Witness", comment: "Saksi")
    let lsWitnessDesc = NSLocalizedString("Reporting someone else's discrimination case", comment: "Melaporkan kejadian diskriminasi yang dialami orang lain")
        
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
                    Text(lsPg1Header)
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Spacer().frame(height:16)
                    Text(lsPg1Desc)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal,36)
                .padding(.top,36)
                Spacer()
            }
            VStack{
                OptionCard(title: lsWitness, subtitle: lsWitnessDesc, icon: "witnessIconBlue", backgroundColor: .white)
                Spacer().frame(height: 27)
                OptionCard(title: lsVictim, subtitle: lsVictimDesc, icon: "victimIconBlue", backgroundColor: .white)
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
    
    //Localized Strings
    let lsPg2Desc : LocalizedStringKey = "Do you want to disclose your identitiy or want to stay anonymous?"
    let lsPg2Header : LocalizedStringKey = "How do you want to report?"
    let lsAnonymous = NSLocalizedString("Anonymous", comment: "Anonim")
    let lsAnonymousDesc = NSLocalizedString("Your personal identity will stay as anonymous", comment: "Identitas diri anda akan dirahasiakan")
    let lsIdentified = NSLocalizedString("Identified", comment: "Teridentifikasi")
    let lsIdentifiedDesc = NSLocalizedString("Your personal identity will be reaveled in the report", comment: "Identitas diri anda akan diungkap ke HRD")
    
    var body: some View{
        ZStack{
            VStack{
                Image("background_report_a_case")
                Spacer()
            }
            VStack{
                modalTopBar(topBarStyle: .white)
                VStack(alignment:.leading){
                    Text(lsPg2Header)
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Spacer().frame(height:16)
                    Text(lsPg2Desc)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal,36)
                .padding(.top,36)
                Spacer()
            }
            VStack{
                Button(action: {}, label: {
                    OptionCard(title: lsAnonymous, subtitle: lsAnonymousDesc, icon: "anonymousIconWhite", backgroundColor: .white)
                })
                Spacer().frame(height: 27)
                Button(action: {}, label: {
                    OptionCard(title: lsIdentified, subtitle: lsIdentifiedDesc, icon: "identifiedIconWhite", backgroundColor: .white)
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
 
    //Localized Strings
    let lsPg3Header:LocalizedStringKey = "Discrimination Detail"
    let lsDateTime : LocalizedStringKey = "Date and time of Incident"
    let lsDateTimeHint : LocalizedStringKey = "Enter Date and time of Incident"
    let lsPlace : LocalizedStringKey = "Place of Incident"
    let lsPlaceHint : LocalizedStringKey = "Enter place of Incident"
    let lsVictimName : LocalizedStringKey = "Victim Name"
    let lsVictimNameHint : LocalizedStringKey = "Select victim name"
    let lsOffenderName : LocalizedStringKey = "Offender Name"
    let lsOffenderNameHint : LocalizedStringKey = "Select Offender name"
    let lsDone : LocalizedStringKey = "Done"
    
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
                    Text(lsDone)
                })
            }
            .padding(40)
            .opacity(showDatePicker ? 1 : 0)
            
            
            VStack(alignment: .leading){
                Text(lsPg3Header)
                    .font(.title)
                    .bold()
                    .foregroundColor(Colors.primaryColor)
                    .padding(.bottom,36)
                    .padding(.top, 66)
                VStack(alignment: .leading){
                    Text(lsDateTime)
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
                    Text(lsPlace)
                    TextField(lsPlaceHint, text: $vm.IncidentPlace)
                        .padding(.leading,15)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                        
                    Spacer().frame(height: 24)
                }
                VStack(alignment: .leading){
                    Text(lsVictimName)
                    TextField(lsVictimNameHint, text: $vm.victim)
                        .padding(.leading,15)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                    Spacer().frame(height: 24)
                }
                VStack(alignment: .leading){
                    Text(lsOffenderName)
                    TextField(lsOffenderNameHint, text: $vm.offender)
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
    //Localized Strings
    let lsClose : LocalizedStringKey = "Close"
    let lsReportCase : LocalizedStringKey = "Report a Case"
    let lsSave : LocalizedStringKey = "Save"
    
    @State var topBarStyle:TopBarStyle
    var body: some View{
        HStack{
            Button(action: {}, label: {
                Text(lsClose)
            })
            .padding()
            
            Spacer()
            
            Text(lsReportCase)
            
            Spacer()
            
            Button(action: {}, label: {
                Text(lsSave)
            })
            .padding()
        }
        .foregroundColor(topBarStyle == .normal ? .none : .white)
    }
}

struct BackNextButton:View{
    //Localized Strings
    let lsNext : LocalizedStringKey = "Next"
    let lsBack : LocalizedStringKey = "Back"
    let pageNumber : LocalizedStringKey = "out of 5"
    
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
                        Text(lsBack)
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
                        Text(lsNext)
                            .foregroundColor(.white)
                    }
                })
            }
        }
    }
}


