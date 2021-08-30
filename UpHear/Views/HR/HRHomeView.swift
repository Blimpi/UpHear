//
//  HRHomeView.swift
//  UpHear
//
//  Created by Bismo Widianto on 05/08/21.
//

import SwiftUI

struct HRHomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var selected = 0
    @State var isPresent:Bool = false
    
    
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    Image("bgTnC")
                        .resizable().aspectRatio(contentMode: .fit).ignoresSafeArea()

                    Spacer()
                }
                VStack{
                    VStack{
                        Text("Cases")
                            .foregroundColor(.white)
                            .font(.title).bold()
                            .padding(.bottom, 25)
                            .font(Font.system(size: 28))
                        SearchBar(keyword: .constant(""))
                        HRTopbar(selected: self.$selected).padding(.top)
                    }
                    
                    ZStack{
                        VStack{
                            if self.selected == 0{
                                waitingCasesView(viewModel: viewModel)
                            }
                            else if self.selected == 1{
                                onGoingCasesView(viewModel: viewModel)
                            }else{
                                closedCasesView(viewModel: viewModel)
                            }
                            
                            //NavigationLink(destination: CreateReportView()
                        }
                    }
                }
            }
            .navigationTitle("My Cases")
        }
        
    }
}

struct onGoingCasesView: View{
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View{
        List{
            ForEach((viewModel.ongoingCases), content: { caseDataResponse in
//                CaseCard(status: caseDataResponse.fields?.status ?? "No Data", caseID: "CA\(String(caseDataResponse.fields?.caseID ?? 000))", incidentDate: String(caseDataResponse.fields?.incidentTime?.prefix(10) ?? "No Data"), offenderName: caseDataResponse.fields?.perpetratorName?[0] ?? "No Data")
                CaseCard(caseData: caseDataResponse)
                    .padding(.vertical, 8)
            })
        }
        .listStyle(PlainListStyle())
        
    }
}

struct closedCasesView: View{
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View{
        List{
            ForEach((viewModel.closedCases), content: { caseDataResponse in
                CaseCard(caseData: caseDataResponse)
//                CaseCard(status: caseDataResponse.fields?.status ?? "No Data", caseID: "CA\(String(caseDataResponse.fields?.caseID ?? 000))", incidentDate: String(caseDataResponse.fields?.incidentTime?.prefix(10) ?? "No Data"), offenderName: caseDataResponse.fields?.perpetratorName?[0] ?? "No Data")
                    .padding(.vertical, 8)
            })
        }
        .listStyle(PlainListStyle())
    }
}

struct waitingCasesView: View{
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View{
        List{
            ForEach((viewModel.caseData.records ?? [CaseDataResponse]()), content: { caseDataResponse in
                //CaseCard(status: caseDataResponse.fields?.status ?? "No Data", caseID: "CA\(String(caseDataResponse.fields?.caseID ?? 000))", incidentDate: caseDataResponse.fields?.incidentTime ?? "No Data", offenderName: caseDataResponse.fields?.perpetratorName?[0] ?? "No Data")
                CaseCard(caseData: caseDataResponse)
                    .padding(.vertical, 8)
            })
        }.listStyle(PlainListStyle())
    }
}

struct HRTopbar : View {
    @Binding var selected : Int
    
    var body : some View{
        HStack{
            Spacer()
            
            Button(action: {
                self.selected = 0
            }) {
                VStack{
                    Text("Waiting")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(Font.system(size: 17))
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 0 ? Color.yellow : Color.clear)
                        .frame(width: 88, height: 6, alignment: .center)
                }
            }
            .foregroundColor(self.selected == 0 ? .white : .gray)
            Spacer()
            
            Button(action: {
                self.selected = 1
            }) {
                VStack{
                    Text("Ongoing")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(Font.system(size: 17))
                        
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 1 ? Color.yellow : Color.clear)
                        .frame(width: 88, height: 6, alignment: .center)
                }
            }
            .foregroundColor(self.selected == 1 ? .white : .gray)
            Spacer()
            
            
            Button(action: {
                self.selected = 2
            }) {
                VStack{
                    Text("Closed")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(Font.system(size: 17))
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 2 ? Color.yellow : Color.clear)
                        .frame(width: 88, height: 6, alignment: .center)
                }
            }
            .foregroundColor(self.selected == 2 ? .white : .gray)
            Spacer()
        }
    }
}


struct SearchBar: View {
    @Binding var keyword: String
    
    @State var selected = 0
    @State var isPresent:Bool = false
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search by status, date or perpetrator", text: $keyword)
                .foregroundColor(.primaryColor)
                .padding(8)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8).overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.buttonColor)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.keyword = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.keyword = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }.frame(width: 375, height: 36)
        
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text: .constant(""))
//    }
//}

struct HRHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HRHomeView(viewModel: HomeViewModel(mainView: UpHearApp()))
    }
}
