//
//  UserProfile.swift
//  UpHear
//
//  Created by Bismo Widianto on 02/08/21.
//
import SwiftUI

struct UserProfileView: View {
    @ObservedObject var viewModel: UserProfileViewModel
    
    @ObservedObject var imageLoader:ImageLoader
    @State var profilePic: UIImage = UIImage()
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: UserProfileViewModel){
        self.viewModel = viewModel
        
        imageLoader = ImageLoader(urlString: "https://asset.kompas.com/crops/Rk0Fy5EsGu0Y8QYND1-E8sxYAM4=/0x0:900x600/750x500/data/photo/2019/12/29/5e0887489f3e2.jpeg")
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
                    Image("bgUserProfile-1").ignoresSafeArea()
                    Spacer()
                }
                VStack{
                    ZStack{
                        
                        Image(uiImage: profilePic)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 104, height: 101, alignment: .center)
                            .shadow(radius: 7)
                            .padding(.top, 60)
                            .onReceive(imageLoader.didChange, perform: { data in
                            self.profilePic = UIImage(data: data) ?? UIImage(named: "Wimpi")!
                        })
                        Image(uiImage: UIImage())
                            
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
                    Text(viewModel.user.email ?? "No Data")
                        .modifier(userInfoStyle())
                    //Company Name
                    Text(viewModel.user.companyName?[0] ?? "No Data")
                        .modifier(userInfoStyle())
                        
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
                                    .modifier(statsCardContentStyle())
                                Text("Ongoing cases")
                                    .modifier(statsCardHeaderStyle())
                            }
                            Rectangle()
                                .fill(Colors.customGray)
                                .frame(width: 1, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack{
                                Text("3")
                                    .modifier(statsCardContentStyle())
                                Text("Solved cases")
                                    .modifier(statsCardHeaderStyle())
                            }
                            Rectangle()
                                .fill(Colors.customGray)
                                .frame(width: 1, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack{
                                Text("5")
                                    .modifier(statsCardContentStyle())
                                Text("Total cases")
                                    .modifier(statsCardHeaderStyle())
                            }
                        }
                    }.frame(width: 324, height: 101)
                    
                    VStack(alignment: .leading){
                        Text("Full Name")
                            .modifier(userInfoHeaderStyle())
                        
                        TextField(
                                "  Enter Full Name",
                            text: $viewModel.name
                        )
                        .padding(8)
                        .modifier(userInfoDetailStyle())
                        
                        Text("Position")
                            .modifier(userInfoHeaderStyle())
                        
                        TextField(
                                "  Enter Current Position",
                            text: $viewModel.position
                        )
                        .padding(8)
                        .modifier(userInfoDetailStyle())
                        
                        Text("Division")
                            .modifier(userInfoHeaderStyle())
                        TextField(
                                "  Enter Current Division",
                            text: $viewModel.division
                        )
                        .padding(8)
                        .modifier(userInfoDetailStyle())
                        
                    }.padding()
                    
                    Button(action: {
                        viewModel.logout()
                    }, label: {
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
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(("Profile"),displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                    Image(systemName: "chevron.left")
            }.accentColor(.white)//, trailing: Button(action: {}){
//                Text("Done")
//            }
            )
        }
        .navigationBarHidden(true)
    }
}

struct statsCardHeaderStyle: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(Font.system(size: 12))
            .foregroundColor(.subheadline)
            .frame(width: 100)
    }
}

struct statsCardContentStyle: ViewModifier{
    func body(content: Content) -> some View{
        return content
            .font(Font.system(size: 28))
            .foregroundColor(.buttonColor)
    }
}

struct userInfoStyle: ViewModifier{
    func body (content: Content) -> some View{
        return content
            .font(Font.system(size: 16))
            .foregroundColor(.subheadline)
            .padding(.bottom,2)
    }
}

struct userInfoDetailStyle: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .frame(width: 335, height:45)
            .border(Color.gray, width: 2)
            .cornerRadius(4)
    }
}

struct userInfoHeaderStyle: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(Font.system(size: 16).weight(.semibold))
            .foregroundColor(.buttonColor)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(viewModel: UserProfileViewModel(mainView: UpHearApp()))
    }
}

////NavigationLink(destination: HomeView())
