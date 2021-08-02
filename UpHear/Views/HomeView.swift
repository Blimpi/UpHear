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
    
    
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
       }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("bgTnC").renderingMode(.original).ignoresSafeArea()
                    Spacer()
                }
                VStack{
                    VStack{
                        Topbar(selected: self.$selected).padding(.top)
                    }
                    
                    ZStack{
                        VStack{
                            if self.selected == 0{
                                onGoingCasesView()
                            }
                            else{
                                
                                closedCasesView()
                            }
                            Button(action: {}, label: {
                                Text("Report a Case").frame(maxWidth: .infinity, maxHeight: 50)
                            }).frame(alignment: .center)
                            .background(Color.primaryColor)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(Font.system(size: 17)).padding(.horizontal,27)
                        }
                    }
                }
            }
            .navigationTitle("My Cases")
        }
        
        
    }
}

struct Topbar : View {
    @Binding var selected : Int
    
    var body : some View{
        HStack{
            Spacer()
            Button(action: {
                self.selected = 0
                
            }) {
                VStack{
                    Text("Ongoing")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(Font.system(size: 17))
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 0 ? Color.yellow : Color.clear)
                        .frame(width: 97, height: 6, alignment: .center)
                }
            }
            .foregroundColor(self.selected == 0 ? .white : .gray)
            
            Spacer()
            Button(action: {
                
                self.selected = 1
                
            }) {
                VStack{
                    Text("Closed")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(Font.system(size: 17))
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.selected == 1 ? Color.yellow : Color.clear)
                        .frame(width: 97, height: 6, alignment: .center)
                }
            }
            .foregroundColor(self.selected == 1 ? .white : .gray)
            Spacer()
            }
            
    }
}

struct onGoingCasesView: View{
    var body: some View{
        List{
            Text("Ini onGoing Cases")
            CaseRow_swiftUI()
            CaseRow_swiftUI()
            CaseRow_swiftUI()
        }.listStyle(PlainListStyle())
    }
}

struct closedCasesView: View{
    var body: some View{
        List{
            Text("Ini closed Cases")
            CaseRow_swiftUI()
            CaseRow_swiftUI()
            CaseRow_swiftUI()
        }.listStyle(PlainListStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
