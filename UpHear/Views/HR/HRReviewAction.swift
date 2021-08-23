//
//  HRReviewAction.swift
//  UpHear
//
//  Created by Bismo Widianto on 20/08/21.
//

import SwiftUI

struct HRReviewAction: View {
    
    @State private var status: String = "Ask for more evidence"
    @State private var details: String = "Please upload more evidence"
    @State private var description: String = "I’ve attached several additional evidence for this case."
    @State private var alertIsPresented = false
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Image("bgTnC")
                        .resizable()
                        .ignoresSafeArea()
                        
                        .frame(width: 390, height: 16)
                        
                    Spacer()
                }
                VStack {
                    ZStack(alignment:.leading){
                        RoundedRectangle(cornerRadius: 9)
                            .foregroundColor(Colors.lightBlue2)
                        
                        VStack(alignment: .leading){
                            Text("Status")
                                .modifier(headerStyle1())
                            Text(status)
                                .padding(.bottom,16)
                                .modifier(detailStyle1())
                                
                            
                            Text("Details")
                                .modifier(headerStyle1())
                            Text(details)
                                .modifier(detailStyle1())
                            
                        }
                    }.frame(width: 342, height: 164)
                    .padding(.bottom,32)
                    .padding(.top,32)
                    
                    
                    Rectangle()
                        .fill(Colors.lightBlue2)
                        .cornerRadius(9)
                        .overlay(
                            VStack(alignment:.leading){
                                Text("Submitted Files")
                                    .modifier(headerStyle1())
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack(spacing:8){
                                        ForEach(1...4, id: \.self){_ in
                                            Image("Wimpi")
                                                .resizable()
                                                .frame(width: 112, height: 99)
                                                
                                        }
                                    }.padding(.leading,24)
                                    .padding(.trailing,24)
                                }
                                
                                Text("Description")
                                    .modifier(headerStyle1())
                                    .padding(.top,16)
                                Text(description)
                                    .padding(.leading,24)
                            }
                        )
                        .frame(width: 342, height: 269, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    
                    
                    
                    Button(action: {}, label: {
                        Text("Accept Action")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }).frame(width: 342, height: 50, alignment: .center)
                    .background(Color.buttonColor)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.bottom,8)
                    .padding(.top,89)
                    
                    .alert(isPresented: $alertIsPresented, content: {
                        Alert(title: Text("Accept Action"),message: Text("Please make sure submitted action is correct and no information is missing."), primaryButton:.default(Text("Accept")), secondaryButton:.cancel())
                    })
                    
                    Button(action: {rejectAlertView()}, label: {
                        Text("Reject Action")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }).frame(width: 342, height: 50, alignment: .center)
                    .background(Color.white)
                    .border(Colors.destructive)
                    .cornerRadius(8)
                    .foregroundColor(.red)
                }
                .navigationBarTitle(("NAMA ACTION"),displayMode: .inline)
                .navigationBarItems(leading: Button(action: { }) {
                    Image(systemName: "chevron.left").accentColor(.white).font(.system(size: 24).weight(.semibold))
            })
            }
        }
        
        
    }
    
    func rejectAlertView(){
        //https://www.youtube.com/watch?v=z5qtZv0fHgc
        let alert = UIAlertController(title: "Reject Action", message: "Please insert the reason why this submitted action is rejected.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title : "Cancel", style: .default)
        let rejectAction = UIAlertAction(title: "Reject", style: .destructive)
        
        
        alert.addTextField{
            reason in
            reason.placeholder = "Insert reason here"
        }
        alert.addAction(rejectAction)
        alert.addAction(cancelAction)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            //blablabla
        })
        
    }
    
}

struct headerStyle1: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(Font.system(size: 20).weight(.regular))
            .foregroundColor(.buttonColor)
            .padding(.leading,24)
    }
}

struct detailStyle1: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(Font.system(size: 18).weight(.bold))
            .foregroundColor(.black)
            .padding(.leading,24)
    }
}

struct HRReviewAction_Previews: PreviewProvider {
    static var previews: some View {
        HRReviewAction()
    }
}
