//
//  CaseRow.swiftUI.swift
//  UpHear
//
//  Created by Bismo Widianto on 31/07/21.
//

import SwiftUI

struct CaseCard: View {
    
    let dateHeader:LocalizedStringKey = "Date of Incident"
    let offenderHeader:LocalizedStringKey = "Offender Name"
    var helper: CaseCardHelper = CaseCardHelper()
    @State var caseDatas: CaseDataResponse
    
    @State var status: String
    @State var caseID: String
    @State var incidentDate: String
    @State var offenderName: String
    init(caseData :CaseDataResponse){
        status = caseData.fields?.status ?? ""
        caseID = helper.CaseIDFormat(caseData.fields?.caseID ?? 0)
        incidentDate = helper.caseDateFormat(caseData.fields?.incidentTime ?? "")
        offenderName = caseData.fields?.perpetratorName?.first ?? ""
        caseDatas = caseData
    }
    
    var body: some View {
        Button {
            
        } label: {
                ZStack{
                    VStack(alignment: .leading){
                        HStack{
                            Text(status)
                                .fontWeight(.bold)
                                .font(Font.system(size:16))
                                .foregroundColor(.primaryColor)
                                .padding(.bottom, 5)
                            Spacer()
                            Image(systemName: "exclamationmark.circle.fill")
                                .font(.system(size: 26).bold())
                                .foregroundColor(Colors.secondaryColor)
                        }
                        Text(caseID)
                            .font(Font.system(size:18))
                            .foregroundColor(.subheadline)
                            .padding(.bottom, 13)
                        
                        Text(dateHeader)
                            .font(Font.system(size: 12))
                            .foregroundColor(.subheadline)
                        
                        Text(incidentDate)
                            .padding(.bottom, 5)
                            .font(Font.system(size: 18))
                            
                        Text(offenderHeader)
                            .font(Font.system(size: 12))
                            .foregroundColor(.subheadline)
                        
                        Text(offenderName)
                            .font(Font.system(size: 18))
                        Spacer()
                        
                    }.padding()
                    HStack{
                        Spacer()
                        Image("chevron").padding(.trailing,14)
                    }
                }.background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.cardBgColor)
                        .frame(width: 323, height:193)
                        .shadow(color: .black.opacity(0.5), radius:4, x: 0, y: 2)
                )
            
        }
    }
}


extension Color{
    static let primaryColor = Color("buttonColor")
    static let cardBgColor = Color("cardBgColor")
    static let subheadline = Color("subHeadlineColor")
}

//struct CaseCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CaseCard(status: "Waiting", caseID: "CA001", incidentDate: "20 July 2021", offenderName: "Wimpi")
//    }
//}
