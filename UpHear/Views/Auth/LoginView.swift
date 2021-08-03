//
//  LoginView.swift
//  UpHear
//
//  Created by Timothy Ananda on 02/08/21.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = AuthViewModel()
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    TextField(
                            "  Enter email",
                             text: $email
                    ).frame(height:45)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.init(top: 10, leading: 23, bottom: 10, trailing: 23))
                    
                    TextField(
                            "  Enter password",
                             text: $password
                    ).frame(height:45)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.init(top: 10, leading: 23, bottom: 10, trailing: 23))
                    
                    Button(action: { viewModel.login(email: email, password: password) }) {
                        Rectangle().fill(Colors.primaryColor)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight:50, alignment: .center)
                            .padding(.horizontal, 23).overlay(
                                Text("Login").accentColor(.white)
                            )
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
