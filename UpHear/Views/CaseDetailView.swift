//
//  CaseDetailView.swift
//  UpHear
//
//  Created by Meichel Rendio on 01/08/21.
//

import SwiftUI



struct CaseDetailView: View {
    @State var selected = 0
    @State var detailCase: CaseDataResponse
    init(cases: CaseDataResponse) {
           //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "primaryColor")!]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor.white
        detailCase = cases
       }
    
    var body: some View {
        ZStack{
            VStack{
                Image("bgTnC")
                Spacer()
            }.ignoresSafeArea()
            VStack{
                VStack{
                    DetailTopbar(selected: self.$selected)
                }

                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .ignoresSafeArea()
                    VStack{
                        if self.selected == 0{
                            detailsCaseView(cases: $detailCase)
                        }
                        else{
                            statusCaseView()
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}


struct DetailTopbar : View {
   @Binding var selected : Int
   var body : some View{
       HStack{
        Spacer()
           //Ongoing
        Button(action: {
               self.selected = 0
           }){
               VStack{
                   Text("Details")
                       .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                       .font(Font.system(size: 17))
                   RoundedRectangle(cornerRadius: 3)
                       .fill(self.selected == 0 ? Color.yellow : Color.clear)
                       .frame(width: 97, height: 6, alignment: .center)
                        .padding(.top,-3)
               }
           }.foregroundColor(self.selected == 0 ? .white : .gray)
        Spacer()
        Button(action: {
               self.selected = 1
           }) {
               VStack{
                   Text("Status")
                       .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                       .font(Font.system(size: 17))
                   RoundedRectangle(cornerRadius: 3)
                       .fill(self.selected == 1 ? Color.yellow : Color.clear)
                       .frame(width: 97, height: 6, alignment: .center)
                        .padding(.top,-3)
               }
           }.foregroundColor(self.selected == 1 ? .white : .gray)
        Spacer()
    }.animation(.default)
   }
}

struct detailsCaseView: View{
    @Binding var cases: CaseDataResponse
    var body: some View{
        ScrollView(.vertical){
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Spacer().frame(height: 36)
                    Text("Report as")
                        .modifier(caseInfoHeaderStyle())
                    Text(cases.fields?.reporterName == cases.fields?.victimName ? "Victim" : "Witness")
                        .modifier(caseInfoDetailStyle())
                    Spacer().frame(height: 8)
                }
                VStack(alignment: .leading){
                    Text("Identity")
                        .modifier(caseInfoHeaderStyle())
                    Text(cases.fields?.isAnonymous == "true" ? "Anonymous" : "Identified")
                        .modifier(caseInfoDetailStyle())
                    Spacer().frame(height: 8)
                }
                VStack(alignment: .leading){
                    Text("Date and Time of Incident")
                        .modifier(caseInfoHeaderStyle())
                    Text(cases.fields?.incidentTime ?? "")
                        .modifier(caseInfoDetailStyle())
                    Spacer().frame(height: 8)
                }
                VStack(alignment: .leading){
                    Text("Place of Incident")
                        .modifier(caseInfoHeaderStyle())
                    Text(cases.fields?.incidentPlace ?? "")
                        .modifier(caseInfoDetailStyle())
                    Spacer().frame(height: 8)
                }
                VStack(alignment: .leading){
                    Text("Victim Name")
                        .modifier(caseInfoHeaderStyle())
                    Text(cases.fields?.victimName?.first ?? "")
                        .modifier(caseInfoDetailStyle())
                    Spacer().frame(height: 8)
                }
                VStack(alignment: .leading){
                    Text("Perpretator Name")
                        .modifier(caseInfoHeaderStyle())
                    Text(cases.fields?.perpetratorName?.first ?? "")
                        .modifier(caseInfoDetailStyle())
                    Spacer().frame(height: 8)
                }
                VStack(alignment: .leading){
                    Text("Description")
                        .modifier(caseInfoHeaderStyle())
                    
                    Rectangle().fill(Color.clear)
                    .frame(height: 219, alignment: .leading)
                    .border(Color.primaryColor, width: 2)
                    .cornerRadius(8)
                    .overlay(
                        ScrollView{
                            Text(cases.fields?.incidentDetail ?? "")
                                .multilineTextAlignment(.leading)
                        }.padding(.horizontal, 18).padding(.vertical,21)
                    )
                }
                VStack(alignment: .leading){
                    Text("Incident Evidence").font(.system(size: 14).weight(.regular)).foregroundColor(Colors.primaryColor)
                    Image("Add_Incident_Button").renderingMode(.original)
                }
                Spacer()
            }.padding(.horizontal,28)
        }
    }
}

struct caseInfoHeaderStyle:ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 14).weight(.regular))
            .foregroundColor(Colors.primaryColor)
    }
}

struct caseInfoDetailStyle:ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 18).weight(.bold))
    }
}


struct statusCaseView: View{
    var body: some View{
        VStack{
            VStack(alignment: .leading){
                Text("Status Timeline").font(.system(size: 20)).foregroundColor(Colors.primaryColor).fontWeight(.bold)
                Spacer().frame(height: 13)
                statusTimeline(isLast: false,isFirst: true)
                statusTimeline(isLast: false)
                statusTimeline(isLast: false)
                statusTimeline(isLast: true)
                Text("").frame(maxWidth: .infinity)
            }.padding(.vertical,26).padding(.horizontal,33)
            
            VStack(alignment: .leading){
                Text("Required Actions").font(.system(size: 20)).foregroundColor(Colors.primaryColor).fontWeight(.bold)
                Spacer().frame(height: 13)
                Text("").frame(maxWidth: .infinity)
                RequiredActionsCard()
            }.padding(.horizontal,33)
            Spacer()
        }
        
        
    }
}

struct statusTimeline: View{
    @State var isLast: Bool = false
    @State var isFirst: Bool = false
    var body: some View{
        VStack{
            HStack(alignment: .top){
                if(!isLast){
                    VStack{
                        if(isFirst){
                            Circle().fill(Colors.primaryColor).frame(width: 17, height: 17).padding(.top,3).padding(.bottom,-4)
                        }else{
                            Circle().fill(Colors.lightBlue).frame(width: 17, height: 17).padding(.top,3).padding(.bottom,-4)
                        }
                        Rectangle().fill(Colors.lightBlue).frame(width: 3, height: 25,alignment: .center).padding(.vertical,-4)
                        Rectangle().fill(Colors.lightBlue).frame(width: 3, height: 25,alignment: .center).padding(.vertical,-4)
                    }
                    VStack(alignment: .leading){
                        Text("Need more evidence").font(.system(size: 15).weight(.regular))
                        Spacer().frame(height:5)
                        Text("Need more evidence").font(.system(size: 12).weight(.regular)).foregroundColor(Colors.customGray)
                        Spacer().frame(height:5)
                        Text("Need more evidence").font(.system(size: 12).weight(.regular)).foregroundColor(Colors.customGray)
                    }
                }else{
                    VStack{
                        Circle().fill(Colors.lightBlue).frame(width: 17, height: 17).padding(.top,3).padding(.bottom,-4)
                    }
                    VStack(alignment: .leading){
                        Text("Need more evidence").font(.system(size: 15).weight(.regular))
                        Spacer().frame(height:5)
                        Text("Need more evidence").font(.system(size: 12).weight(.regular)).foregroundColor(Colors.customGray)
                        Spacer().frame(height:5)
                        Text("Need more evidence").font(.system(size: 12).weight(.regular)).foregroundColor(Colors.customGray)
                    }
                }
        }
    }
}

//    enum Detailsegment: String, CaseIterable{
//       case onGoing = "Details"
//       case closed = "Status"
//    }
//
//
//    struct ChosenSegment: View{
//       var selectedSegment: segment
//
//       var body: some View{
//           switch selectedSegment{
//           case .onGoing:
//               onGoingCasesView()
//
//
//           case .closed:
//               closedCasesView()
//           }
//       }
//    }
//
//
//    struct onGoingCasesView: View{
//       var body: some View{
//
//           List{
//               Text("Ini onGoing Cases")
//               CaseRow_swiftUI()
//               CaseRow_swiftUI()
//               CaseRow_swiftUI()
//           }.listStyle(PlainListStyle())
//       }
//    }
//
//    struct closedCasesView: View{
//       var body: some View{
//           List{
//               Text("Ini closed Cases")
//               CaseRow_swiftUI()
//               CaseRow_swiftUI()
//               CaseRow_swiftUI()
//           }.listStyle(PlainListStyle())
//       }
//    }

//    struct CaseDetailView_Previews: PreviewProvider {
//       static var previews: some View {
//           CaseDetailView()
//       }
//    }

}
