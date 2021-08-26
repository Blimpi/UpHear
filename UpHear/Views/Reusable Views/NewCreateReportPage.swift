//
//  NewCreateReportPage.swift
//  UpHear
//
//  Created by Meichel Rendio on 24/08/21.
//

import SwiftUI

struct NewCreateReportPage: View {
    @ObservedObject var vms: CreateReportViewModel
    var body: some View {
        switch vms.currentIndex {
        case 1:
            firstPage(vm: vms)
        case 2:
            SecondPage(vm: vms)
        case 3:
            thirdPage(vm: vms)
        case 4:
            forthPage(vm: vms)
        case 5:
            fifthPage(vm: vms)
        case 6:
            ReportSummaryView(vm: vms)
        default:
            Text("Out of Index\(vms.currentIndex)")
        }
    }
}

enum TopBarStyle{
    case normal
    case white
}

// reuseable
struct modalTopBar: View{
    @State var topBarStyle:TopBarStyle
    var body: some View{
        HStack{
            Button(action: {}, label: {
                Text("Close")
            })
            .padding()
            
            Spacer()
            
            Text("Report a Case")
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Save")
            })
            .padding()
        }
        .foregroundColor(topBarStyle == .normal ? .none : .white)
    }
}
struct addFileButton: View {
    @ObservedObject var vm: CreateReportViewModel
    @Binding var placeholderImage: UIImage?
    @State var showImagePicker:Bool = false
    var body: some View{
        Button(action: {
            showImagePicker.toggle()
        }, label: {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Colors.primaryColor, lineWidth: 1)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .overlay(
                    HStack{
                        Image(systemName: "plus.circle")
                            .foregroundColor(Colors.primaryColor)
                            .font(.system(size: 24))
                        Spacer()
                        Text("Add file")
                            .foregroundColor(Colors.primaryColor)
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal, 28)
                )
        })
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$placeholderImage)
        
        }
        
    }
}

struct BackNextButton:View{
    @ObservedObject var vm: CreateReportViewModel
    var body: some View{
        VStack{
            Text("\(vm.currentIndex) out of 5")
                .font(.callout)
            HStack{
                Button(action: {
                    vm.reduceIndex()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(Colors.primaryColor,lineWidth: 1)
                            .frame(width: 153, height: 50)
                        Text("Back")
                            .foregroundColor(Colors.primaryColor)
                    }
                })
                
                Button(action: {
                    vm.addIndex()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Colors.primaryColor)
                            .frame(width: 153, height: 50)
                        Text("Next")
                            .foregroundColor(.white)
                    }
                })
            }
        }
    }
}


