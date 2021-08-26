//
//  ReportSummaryView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct ReportSummaryView: View {
    //@StateObject var vm: CreateReportViewModel = CreateReportViewModel()
    @ObservedObject var vm: CreateReportViewModel
    var body: some View{
        ZStack{
            VStack{
                modalTopBar(topBarStyle: .normal)
                ScrollView{
                    VStack{
                        reportDetail(title: "Reporting as", subtitle: vm.victim)
                        reportDetail(title: "Identity", subtitle: vm.publication.rawValue)
                        reportDetail(title: "Date and time of incident", subtitle: "\(vm.incidentDate)")
                        reportDetail(title: "Place of incident", subtitle: vm.IncidentPlace)
                        reportDetail(title: "Offender's Name", subtitle: vm.offender, isLast: true)
                    }.padding(.vertical, 16)
                    .background(Rectangle()
                                    .fill(Colors.cardBackground)
                                    .cornerRadius(8)
                                    .clipped())
                    .padding(.horizontal, 32)
                    
                    VStack(alignment: .leading){
                        reportDetail(title: "Description", subtitle: vm.description, isLast: true)
                            .padding(.vertical, 8)
                        Text("Incident Evidence")
                            .font(
                                .system(size: 15)
                                    .weight(.regular))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(0..<10){index in
                                    if(index<vm.arrayOfEvidenceImage.count){
                                        Image(uiImage: vm.arrayOfEvidenceImage[index])
                                            .resizable()
                                            .frame(maxWidth: 85, maxHeight: 85)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,16)
                        
                    }.padding(.vertical,16)
                    .background(Rectangle()
                                    .fill(Colors.cardBackground)
                                    .cornerRadius(8)
                                    .clipped())
                    .padding(.horizontal, 32)
                    
                    
                }
                Spacer()
                Button(action: {
                    vm.uploadImageToDatabase()
                }, label: {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Colors.primaryColor)
                        .frame(maxWidth:.infinity, maxHeight: 50)
                        .overlay(
                            Text("Submit Report")
                                .foregroundColor(.white)
                        )
                }).padding(.horizontal,32)
            }
        }
    }
            
}

struct reportDetail: View{
    @State var title: String = ""
    @State var subtitle: String = ""
    @State var isLast: Bool = false
    var body: some View{
        VStack{
            VStack(alignment: .leading){
                Text("\(title)")
                    .font(
                        .system(size: 15)
                            .weight(.regular))
                    .foregroundColor(.gray)
                Text("\(subtitle)")
                    .font(
                        .system(size: 18)
                            .weight(.semibold))
                    .foregroundColor(.black)
                if(!isLast){
                    Rectangle()
                        .fill(Color.gray)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .opacity(isLast ? 0 : 1)
                }else{
                    Text("").frame(maxWidth:.infinity, maxHeight: 0)
                }
                
            }.frame(maxWidth: .infinity)
        }.padding(.horizontal, 16)
    }
}

//struct ReportSummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReportSummaryView()
//    }
//}
