//
//  FifthPage.swift
//  UpHear
//
//  Created by Meichel Rendio on 26/08/21.
//

import SwiftUI

struct fifthPage: View{
    @ObservedObject var vm: CreateReportViewModel
    @State var placeholderImage: UIImage? = UIImage(named:"bgLogin")
    //@State var imageArr:[Image]
    
    var body: some View{
        ZStack{
            VStack{
                modalTopBar(vm: vm,topBarStyle: .normal)
                Spacer()
            }
            VStack(alignment:.leading){
                Text("Incident Evidence")
                    .font(.title)
                    .bold()
                    .foregroundColor(Colors.primaryColor)
                    .padding(.bottom,36)
                    
                Text("Please identify any documents, e-mails, records, materials and other evidence including witnesses whom you believe may have information pertaining to your complaint.")
                    .font(
                        .system(size: 17).weight(.medium)
                    )
                    .foregroundColor(Colors.primaryColor)
                    .padding(.bottom,8)
                addFileButton(vm: vm,placeholderImage: $placeholderImage)
                    .onChange(of: placeholderImage, perform: { value in
                    vm.addPict(Img: placeholderImage!)
                })
                ScrollView(.horizontal){
                    HStack{
                        ForEach (0..<10){
                            indx in
                            if(indx<vm.arrayOfEvidenceImage.count){
                                EvidanceCell(image: Image(uiImage: vm.arrayOfEvidenceImage[indx]))
                                    .frame(width: 95, height: 95, alignment: .center)
                            }
                        }
                    }
                }
                Spacer()
                
                
            }
            .padding(.horizontal,36)
            .padding(.top,90)
        
            VStack{
                Spacer()
                BackNextButton(vm: vm)
                Spacer().frame(height: 20)
            }
        }
    }
    
}
