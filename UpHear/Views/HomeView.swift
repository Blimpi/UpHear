//
//  HomeView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct HomeView: View {
    
    //@State private var selectedSegment:segment = .onGoing
    
    @State var selected = 0
    @State var isPresent:Bool = false
    
    let button : LocalizedStringKey = "Report a Case"
    let pageTitle:LocalizedStringKey = "My Cases"
    
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
       }
    
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    Image("bgTnC")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 402, height: 185)

                    Spacer()
                }
                VStack{
                    VStack{
                        HomePageHeader().padding()
                        Topbar(selected: self.$selected)
                    }
                    
                    ZStack{
                        VStack{
                            if self.selected == 0{
                                onGoingCasesView()
                            }
                            else{
                                closedCasesView()
                            }
                            //NavigationLink(destination: CreateReportView()
                            Button(action: {
                                isPresent.toggle()
                            }, label: {
                                Text(button).frame(maxWidth: .infinity, maxHeight: 50).font(.body)
                                    
                            }).frame(alignment: .center)
                            .background(Color.primaryColor)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(Font.system(size: 17)).padding(.horizontal,27)
                            .fullScreenCover(isPresented: $isPresent, content: {
                                CreateReportView()
                            })
                        }
                    }
                }
            }
            .navigationTitle(pageTitle)
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
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(Font.system(size: 17))
                        
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 0 ? Color.yellow : Color.clear)
                        .frame(width: 97, height: 6, alignment: .center)
                        .padding(.top,-3)
                }
            }
            .foregroundColor(self.selected == 0 ? .white : .gray)
            Spacer()
            Button(action: {
                self.selected = 1
            }) {
                VStack{
                    Text(segment2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(Font.system(size: 17))
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 1 ? Color.yellow : Color.clear)
                        .frame(width: 97, height: 6, alignment: .center)
                        .padding(.top,-3)
                }
            }
            .foregroundColor(self.selected == 1 ? .white : .gray)
            Spacer()
        }
    }
}
//KALO G ADA CASES, Tampilin View ini. Panggil di contentView
struct noCases : View{
    let noCases:LocalizedStringKey = "No Cases"
    
    var body : some View{
        VStack{
            Image("noCases")
            Text(noCases)
                .font(Font.system(size: 20))
                .foregroundColor(.subheadline)
        }
    }
}


struct HomePageHeader :View{
    
    let pageHeader:LocalizedStringKey="MyCases"
    var body: some View{
        HStack{
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "person.crop.circle.fill").accentColor(.white).font(.system(size: 30))
            })
            Spacer()
            Spacer()
            Text(pageHeader).foregroundColor(.white).font(.title).bold()
            Spacer()
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "tray.circle.fill").accentColor(.white).font(.system(size: 30))
            })
            Spacer()
        }
    }
}

struct onGoingCasesView: View{
    var body: some View{
        List{
            ForEach((1...4), id: \.self) {i in
                CaseCard().padding(.vertical, 8)
            }
        }.listStyle(PlainListStyle())
        
    }
}

struct closedCasesView: View{
    var body: some View{
        List{
            ForEach((1...4), id: \.self) {i in
                CaseCard().padding(.vertical, 8)
            }
        }.listStyle(PlainListStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct noCases_Previews: PreviewProvider {
    static var previews: some View {
        noCases()
    }
}
