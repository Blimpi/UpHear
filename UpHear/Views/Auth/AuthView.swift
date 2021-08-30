//
//  AuthView.swift
//  UpHear
//
//  Created by Timothy Ananda on 02/08/21.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    
    @State var mode: authMode
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bgLogin")
                    .renderingMode(.original)
                    .ignoresSafeArea()
                
                VStack{
                    Spacer().frame(height: 250)
                    
                    if (mode == .signIn) {
                        signInForm(viewModel: viewModel, mode: $mode)
                    }
                    else if (mode == .signUp) {
                        signUpForm(viewModel: viewModel, mode: $mode)
                    }
                }
                
            }
            
        }
    }
}

struct signInForm: View {
    @State var viewModel: AuthViewModel
    @Binding var mode: authMode
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        Rectangle().fill(Color.white).cornerRadius(46).overlay(
            VStack(alignment: .leading){
                Text("Sign In")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom, 24)
                
                Text("Email").font(.body)
                    .foregroundColor(.primaryColor)
                    .padding(.bottom, -2)
                TextField(
                        "Enter email",
                         text: $email
                )
                .padding(8)
                .frame(height:45)
                .border(Color.gray, width: 2)
                .cornerRadius(4)
                .padding(.bottom, 24)
                
                Text("Password").font(.body).foregroundColor(.primaryColor)
                    .padding(.bottom, -2)
                SecureField("Enter a password", text: $password)
                    .padding(8)
                    .frame(height:45)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.bottom, 40)
                
                Button(action: {
                        viewModel.authButtonPressed(mode: mode, email: email, password: password)
                }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .overlay(
                            Text("Sign In")
                                .bold()
                                .accentColor(.white)
                        )
                }
                
                HStack{
                    Text("Don’t have an account?")
                        .foregroundColor(.gray)
                        
                    Button(action: {mode = .signUp}, label: {
                        Text("Sign Up")
                            .foregroundColor(.primaryColor)
                    })
                }.padding(.horizontal, 28)
            }.padding(.horizontal, 36)
        )
    }
}

struct signUpForm: View {
    @State var viewModel: AuthViewModel
    @Binding var mode: authMode
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        Rectangle().fill(Color.white).cornerRadius(46).overlay(
            VStack(alignment: .leading){
                Text("Sign Up")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom, 24)
                
                Text("Email").font(.body)
                    .foregroundColor(.primaryColor)
                    .padding(.bottom, -2)
                TextField(
                        "Enter email",
                         text: $email
                )
                .padding(8)
                .frame(height:45)
                .border(Color.gray, width: 2)
                .cornerRadius(4)
                .padding(.bottom, 24)
                
                Text("Password").font(.body).foregroundColor(.primaryColor)
                    .padding(.bottom, -2)
                SecureField("Enter a password", text: $password)
                    .padding(8)
                    .frame(height:45)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.bottom, 40)
                
                Button(action: { viewModel.authButtonPressed(mode: mode, email: email, password: password) }) {
                    Rectangle().fill(Colors.primaryColor)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                        .overlay(
                            Text("Sign Up")
                                .bold()
                                .accentColor(.white)
                        )
                }
                
                HStack{
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                        
                    Button(action: {mode = .signIn}, label: {
                        Text("Sign In")
                            .foregroundColor(.primaryColor)
                    })
                }.padding(.horizontal, 28)
            }.padding(.horizontal, 36)
        )
    }
}

//struct AuthView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthView()
//    }
//}
