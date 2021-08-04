//
//  LandingView.swift
//  UpHear
//
//  Created by Bismo Widianto on 01/08/21.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        ZStack{
            Image("bgOnboarding")
                .renderingMode(.original)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("UpHear")
                    .font(.system(size: 55))
                    .foregroundColor(.white)
                Spacer()
                Button(action: {}, label: {
                    Text("Get Started").font(.body).foregroundColor(Colors.primaryColor)
                }).frame(width: 335, height: 50, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
                .foregroundColor(.buttonColor)
                .padding(.bottom,50)
                .padding(.top,30)
                .font(Font.system(size: 17))
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
