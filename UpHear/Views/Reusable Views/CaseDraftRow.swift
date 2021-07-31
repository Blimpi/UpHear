//
//  CaseDraftRow.swift
//  UpHear
//
//  Created by Bismo Widianto on 29/07/21.
//

import SwiftUI

struct CaseDraftRow: View {
    var kasus: Case
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                .fill(Color.white)
            HStack{
                VStack(alignment: .leading){
                    Text("Case \(kasus.id)").font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                        
                    

                    Text("Date of Incident")
                    Text(kasus.incidentDate)
                        .padding(.bottom, 5)
                        
                    Text("Perpretator Name:")
                    Text(kasus.perpetratorName)
                        
                    Spacer()
                }
                Spacer()
                
            }.padding()

        }.frame(height:110)
        .shadow(radius: 7)
        
    }
}

struct CaseDraftRow_Previews: PreviewProvider {
    static var previews: some View {
        //CaseDraftRow()
        Group{
            CaseDraftRow(kasus: cases[0])
            //LandmarkRow(landmark: landmarks[1])
        }
    }
}
