//
//  CaseDraftRow.swift
//  UpHear
//
//  Created by Bismo Widianto on 29/07/21.
//

import SwiftUI

struct CaseDraftRow: View {
    //var kasus: Case
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                .fill(Color.cardBgColor)
            HStack{
                VStack(alignment: .leading){
                    //Text("Case \(kasus.id)").font(.largeTitle)
                    Text("Case 1")
                        .foregroundColor(Color.buttonColor)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                        .font(Font.system(size: 16))
                    
                    Text("Date of Incident")
                        .font(Font.system(size:12))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.subheadline)
                    //Text(kasus.incidentDate)
                        Text("27 July 2020")
                        .padding(.bottom, 5)
                        .font(Font.system(size:18))

                    Text("Perpretator Name:")
                        .font(Font.system(size:12))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.subheadline)
                    //Text(kasus.perpetratorName)
                    Text("Wimpi")
                        .font(Font.system(size:18))

                    Spacer()
                }
                Spacer()

                Image("editIcon")
            }.padding()

        }.frame(height:110)
        .shadow(radius: 7)
        .padding()
    }
    
}

struct CaseDraftRow_Previews: PreviewProvider {
    static var previews: some View {
        //CaseDraftRow()
        Group{
            //CaseDraftRow(kasus: cases[0])
            CaseDraftRow()
            //LandmarkRow(landmark: landmarks[1])
        }
    }
}
