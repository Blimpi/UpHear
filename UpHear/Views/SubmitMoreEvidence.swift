//
//  SubmitMoreEvidence.swift
//  UpHear
//
//  Created by Meichel Rendio on 02/08/21.
//

import SwiftUI

struct SubmitMoreEvidence: View {
    
    init(){
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    var body: some View {
        NavigationView{
            ZStack(){
                VStack{
                    Image("bgTnC")
                        .ignoresSafeArea()
                    Spacer()
                }
                VStack{
                    Spacer().frame(height:40)
                    Rectangle().fill(Color.white)
                }
               
            }.navigationTitle("Submit Actions")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: { }) {
                Image(systemName: "chevron.left").foregroundColor(.white).font(.system(size: 24).weight(.semibold))
            })
        }
    }
}

struct SubmitMoreEvidence_Previews: PreviewProvider {
    static var previews: some View {
        SubmitMoreEvidence()
    }
}
