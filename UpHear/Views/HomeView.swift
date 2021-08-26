//
//  HomeView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var selected = 0
    @State var isPresent:Bool = false
    
    let button : LocalizedStringKey = "Report a Case"
    let pageTitle:LocalizedStringKey = "My Cases"
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
       }
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    VStack{
                        Image("bgMainPage")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 402, height: 118)

                        Spacer()
                    }
                    VStack{
                        VStack{
                            HomePageHeader(viewModel: viewModel).padding()
                            Topbar(selected: self.$selected)
                        }
                        
                        ZStack{
                            VStack{
                                if viewModel.ongoingCases.isEmpty && viewModel.closedCases.isEmpty{
                                    noCases()
                                }else{
                                    if selected == 0{
                                        listCasesView(selected: selected, viewModel: viewModel)
                                    }else if selected == 1{
                                        listCasesView(selected: selected, viewModel: viewModel)
                                    }
                                }
                                
                                Button(action: {
                                    isPresent.toggle()
                                }, label: {
                                    Text(button).frame(maxWidth: .infinity, maxHeight: 50).font(.body)
                                        
                                })
                                .buttonStyle(primaryButtonStyle())
//                                .fullScreenCover(isPresented: $isPresent, content: {
//                                    CreateReportView()
//                                })
                                .sheet(isPresented: $isPresent, content: {
                                    NewCreateReportView()
                                })
                            }
                        }
                    }
                }
                .navigationTitle(pageTitle)
                .navigationBarHidden(true)
            }
        }
    }
}

struct primaryButtonStyle: ButtonStyle{
    public func makeBody(configuration: primaryButtonStyle.Configuration) -> some View {
        configuration.label
            .frame(alignment: .center)
            .background(Color.primaryColor)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(Font.system(size: 17)).padding(.horizontal,27)
    }
}

struct listCasesView: View{
    @State var selected : Int = 0
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View{
        if selected == 0{
            List{
                ForEach((viewModel.ongoingCases), content: { caseDataResponse in
                    CaseCard(status: caseDataResponse.fields?.status ?? "No Data", caseID: "CA\(String(caseDataResponse.fields?.caseID ?? 000))", incidentDate: String(caseDataResponse.fields?.incidentTime?.prefix(10) ?? "No Data"), offenderName: caseDataResponse.fields?.perpetratorName?[0] ?? "No Data")
                        .padding(.vertical, 8)
                })
            }
            .listStyle(PlainListStyle())
            
        }else if selected == 1{
            List{
                ForEach((viewModel.closedCases), content: { caseDataResponse in
                    CaseCard(status: caseDataResponse.fields?.status ?? "No Data", caseID: "CA\(String(caseDataResponse.fields?.caseID ?? 000))", incidentDate: String(caseDataResponse.fields?.incidentTime?.prefix(10) ?? "No Data"), offenderName: caseDataResponse.fields?.perpetratorName?[0] ?? "No Data")
                        .padding(.vertical, 8)
                })
            }
            .listStyle(PlainListStyle())
        }
    }
}


struct Topbar : View {
    @Binding var selected : Int
    let segment1 : LocalizedStringKey = "Ongoing"
    let segment2 : LocalizedStringKey = "Closed"
    
    var body : some View{
        HStack{
            Spacer()
            Button(action: {
                self.selected = 0
            }) {
                VStack{
                    Text(segment1)
                        .modifier(segmentHeader())
                        
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 0 ? Color.yellow : Color.clear)
                        .modifier(selectedHighlight())
                }
            }
            .foregroundColor(self.selected == 0 ? .white : .gray)
            Spacer()
            Button(action: {
                self.selected = 1
            }) {
                VStack{
                    Text(segment2)
                        .modifier(segmentHeader())
                        
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 1 ? Color.yellow : Color.clear)
                        .modifier(selectedHighlight())
                }
            }
            .foregroundColor(self.selected == 1 ? .white : .gray)
            Spacer()
        }
    }
}


struct segmentHeader: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(Font.system(size: 17).weight(.bold))
    }
}

struct selectedHighlight: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .frame(width: 97, height: 6, alignment: .center)
            .padding(.top,-3)
    }
}


struct noCases : View{
    let noCases:LocalizedStringKey = "No Cases"
    
    var body : some View{
        VStack{
            Spacer()
            Image("noCases")
            Text(noCases)
                .font(Font.system(size: 20))
                .foregroundColor(.subheadline)
            Spacer()
        }
    }
}


struct HomePageHeader :View{
    @ObservedObject var viewModel: HomeViewModel
    
    let pageHeader:LocalizedStringKey="MyCases"
    var body: some View{
        HStack{
            Spacer()
            
            NavigationLink(
                destination: UserProfileView(viewModel: UserProfileViewModel(mainView: viewModel.mainView)),
                label: {
                    Image(systemName: "person.crop.circle.fill").accentColor(.white).font(.system(size: 30))
                })
            Spacer()
            Spacer()
            Text(pageHeader).foregroundColor(.white).font(.title).bold()
            Spacer()
            Spacer()
            
            NavigationLink(
                destination: DraftsView(),
                label: {
                    Image(systemName: "tray.circle.fill").accentColor(.white).font(.system(size: 30))
                })
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(mainView: UpHearApp()))
    }
}
