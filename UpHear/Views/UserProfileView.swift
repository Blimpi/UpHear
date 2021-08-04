//
//  UserProfile.swift
//  UpHear
//
//  Created by Bismo Widianto on 02/08/21.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var viewModel: UserProfileViewModel = UserProfileViewModel()
    
    @State var fullName = ""
    @State var position = ""
    @State var division = ""
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("navBarBG").ignoresSafeArea()
                    Spacer()
                }
                VStack{
                    ZStack{
                        Image("Bismo")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 104, height: 101, alignment: .center)
                            .shadow(radius: 7)
                            .padding(.top, 60)
                        
                        Button(action: {
                            print("Tapped")
                        }) {
                            HStack{
                                Image("cameraIcon")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 22, height: 19, alignment: .center)
                                    .shadow(radius: 7)
                                    .padding(.top, 60)
                            }
                        }.offset(x: 35, y: 40)
                    }
                    
                    //Email
                    Text(viewModel.user.email ?? "No User")
                        .font(Font.system(size: 16))
                        .foregroundColor(.subheadline)
                        .padding(.bottom,2)
                    //Company Name
                    Text(viewModel.user.companyName ?? "No Company")
                        .font(Font.system(size: 16))
                        .foregroundColor(.subheadline)
                        .padding(.bottom,2)
                        
                    //Button edit profile
                    Button(action: {}, label: {
                        Text("Edit Profile")
                    }
                    ).frame(width: 149, height: 39, alignment: .center)
                    .background(Color.buttonColor)
                    .cornerRadius(19.5)
                    .foregroundColor(.white)
                    .font(Font.system(size: 17))
                    
                    //Card
                    ZStack{
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color.cardBgColor)
                            .shadow(radius: 4)
                        HStack{
                            VStack{
                                Text("2")
                                    .font(Font.system(size: 28))
                                    .foregroundColor(.buttonColor)
                                Text("Ongoing cases")
                                    .font(Font.system(size: 12))
                                    .foregroundColor(.subheadline)
                                    .frame(width: 100)
                            }
                            Rectangle()
                                .fill(Colors.customGray)
                                .frame(width: 1, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack{
                                Text("3")
                                    .font(Font.system(size: 28))
                                    .foregroundColor(.buttonColor)
                                Text("Solved cases")
                                    .font(Font.system(size: 12))
                                    .foregroundColor(.subheadline)
                                    .frame(width: 100)
                            }
                            Rectangle()
                                .fill(Colors.customGray)
                                .frame(width: 1, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack{
                                Text("5")
                                    .font(Font.system(size: 28))
                                    .foregroundColor(.buttonColor)
                                Text("Total cases")
                                    .font(Font.system(size: 12))
                                    .foregroundColor(.subheadline)
                                    .frame(width: 100)
                            }
                        }
                    }.frame(width: 324, height: 101)
                    
                    VStack(alignment: .leading){
                        Text("Full Name")
                            .fontWeight(.semibold)
                            .foregroundColor(.buttonColor)
                        
                        TextField(
                                "  Enter Full Name",
                            text: $viewModel.name
                        ).frame(width: 335, height:45)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                        
                        Text("Position")
                            .fontWeight(.semibold)
                            .foregroundColor(.buttonColor)
                        
                        TextField(
                                "  Enter Current Position",
                            text: $position //$viewModel.user.position
                        ).frame(width: 335, height:45)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                        
                        Text("Division")
                            .fontWeight(.semibold)
                            .foregroundColor(.buttonColor)
                        TextField(
                                "  Enter Current Division",
                            text: $division //$viewModel.user.division
                        ).frame(width: 335, height:45)
                        .border(Color.gray, width: 2)
                        .cornerRadius(4)
                        
                    }.padding()
                    
                    Button(action: {}, label: {
                        Text("Sign Out")
                            .fontWeight(.bold)
                        
                    }).frame(width: 335, height: 50, alignment: .center)
                    .background(Color.buttonColor)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.bottom,50)
                    .padding(.top,30)
                    .font(Font.system(size: 17))
                }
            }
            .navigationBarTitle(("Profile"),displayMode: .inline)
            .navigationBarItems(leading: Button(action: { }) {
                    Image(systemName: "chevron.left")
            }.accentColor(.white), trailing: Button(action: {}){
                Text("Done")
            })
        }
    }
}
    
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
