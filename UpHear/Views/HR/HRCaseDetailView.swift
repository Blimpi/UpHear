//
//  HRCaseDetailView.swift
//  UpHear
//
//  Created by Bismo Widianto on 05/08/21.
//

import SwiftUI

struct HRCaseDetailView: View {
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    @State var selected = 0
    @State var isPresent:Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                        Image("bgTnC")
                            .resizable()
//                            .aspectRatio(contentMode: .fit)
                            .ignoresSafeArea()
                    
                            
                    CaseDetailTopbar(selected: self.$selected)

                }.frame(width: 390, height: 62)
                .padding(.top,-8)
                    
                    
                ZStack{
                    Colors.cardBackground.ignoresSafeArea()
                    if self.selected == 0{
                        HRCaseDetailSegment()
                        Spacer()
                    }
                    else{
                        HRCaseStatusSegment()
                        Spacer()
                        
                    }
                }
               

            }
            .navigationBarTitle(("Report \(420420)"),displayMode: .inline)
            .navigationBarItems(leading: Button(action: {}){
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            })
            }
            
        }
    }


struct HRCaseDetailSegment : View{
    var body : some View{
        VStack(alignment: .leading){
            //Case Details
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                VStack(alignment: .leading){
                    Section{
                        VStack(alignment: .leading){
                            Text("Report as")
                                .font(.custom("SF Pro Text", size: 14))
                                .foregroundColor(.subheadline)
                            Text("Victim")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(Font.system(size: 18))
                        }.padding(.bottom,16)
                        Divider()
                    }
                    
                    Section{
                        VStack(alignment: .leading){
                            Text("Identity")
                                .font(.custom("SF Pro Text", size: 14))
                                .foregroundColor(.subheadline)
                            Text("Anonymous")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(Font.system(size: 18))
                        }.padding(.bottom,16)
                        Divider()
                    }
                    
                    Section{
                        VStack(alignment: .leading){
                            Text("Date and time of Incident")
                                .font(.custom("SF Pro Text", size: 14))
                                .foregroundColor(.subheadline)
                            Text("Anonymous")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(Font.system(size: 18))
                        }.padding(.bottom,16)
                        Divider()
                    }
                    
                    Section{
                        VStack(alignment: .leading){
                            Text("Date and time of Incident")
                                .font(.custom("SF Pro Text", size: 14))
                                .foregroundColor(.subheadline)
                            Text("1 August 2020 - 8:00 PM")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(Font.system(size: 18))
                        }.padding(.bottom,16)
                        Divider()
                    }
                    
                    
                    Section{
                        VStack(alignment: .leading){
                            Text("Place of Incident")
                                .font(.custom("SF Pro Text", size: 14))
                                .foregroundColor(.subheadline)
                            Text("Meeting Room")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(Font.system(size: 18))
                        }.padding(.bottom,16)
                        Divider()
                    }
                    
                    VStack(alignment: .leading){
                        Text("Offender Name")
                            .font(.custom("SF Pro Text", size: 14))
                            .foregroundColor(.subheadline)
                        Text("Wimpi")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(Font.system(size: 18))
                    }
                }.padding()
                
            }.frame(width: 341, height: 337)
            .padding(.top,-32)
            .padding(.bottom,32)
            
            
            
            
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading){
                    Text("Description")
                        .font(.custom("SF Pro Text", size: 14))
                        .foregroundColor(.subheadline)
                    Text("Wimpi didn’t look at me as her colleague since I’m a Chinese descent. She even went as far as dismissing my work.")
                        .font(Font.system(size: 18))
                        
                }
                
            }.frame(width: 341, height: 137)
            .padding(.top,16)
            

            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)

                VStack(alignment: .leading){
                    Text("Incident Evidence")
                        .font(.custom("SF Pro Text", size: 14))
                        .foregroundColor(.subheadline)
                    Text("THUMBNAIL EVIDENCE NYA DISINI")

                }
            }.frame(width: 341)
            .padding(.top,16)
            
            
            
        }.padding()
    }
}

struct HRCaseStatusSegment : View{
    var body : some View{
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("Status Details")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                    .foregroundColor(.primaryColor)
                    .padding(.bottom, 8)
                
                statusTimeline()
                Spacer()
                
            }.padding(.bottom,10)
            .frame(height: 230)
            
            
            VStack(alignment: .leading){
                Text("Submitted Action")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                    .foregroundColor(.primaryColor)
                    .padding(.bottom, 8)
                
                HRActionCard()
                Spacer()
            }.padding(.bottom,10)
            .frame(height: 230)
            
            Button(action: {}, label: {
                Text("Add Action").font(.body)
            }).frame(width: 335, height: 50, alignment: .center)
            .background(Color.buttonColor)
            .cornerRadius(10)
            .foregroundColor(.white)
        }.padding(.top, 16)
    }
}


struct CaseDetailTopbar : View {
    @Binding var selected : Int
    
    var body : some View{
        HStack{
            Spacer()
            Button(action: {
                self.selected = 0
            }) {
                VStack{
                    Text("Details")
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
                    Text("Status")
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


struct HRCaseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HRCaseDetailView()
    }
}

//struct HRCaseDetailSegment_Previews: PreviewProvider {
//    static var previews: some View {
//        //CaseDraftRow()
//        Group{
//            //CaseDraftRow(kasus: cases[0])
//            HRCaseDetailSegment()
//            //LandmarkRow(landmark: landmarks[1])
//        }
//    }
//}

//struct HRCaseStatussSegment_Previews: PreviewProvider {
//    static var previews: some View {
//        //CaseDraftRow()
//        Group{
//            //CaseDraftRow(kasus: cases[0])
//            HRCaseStatusSegment()
//            //LandmarkRow(landmark: landmarks[1])
//        }
//    }
//}
