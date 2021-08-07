//
//  testPicker.swift
//  UpHear
//
//  Created by Meichel Rendio on 06/08/21.
//

import SwiftUI

struct testPicker: View {
    @State var placeHolder: String = "Enter date and time of Incident"
    @State var date = Date()
    @State var showPicker = false
        var body: some View {
            ZStack {
//                DatePicker("labellasldadlsalsdalsdlasdasd", selection: $date, displayedComponents: [.date])
//                    .datePickerStyle(CompactDatePickerStyle())
//                    .labelsHidden()
                VStack{
                    Button(action: {
                        showPicker = true
                    }, label: {
                        HStack{
                            Text("Enter date and time of incident")
                                .foregroundColor(Colors.customGray)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Spacer()
                        }
                        
                            
                    }).frame(maxWidth: .infinity, maxHeight: 45)
                    .background(Color.white)
                    .border(Color.gray, width: 2)
                    .cornerRadius(4)
                    .padding(.trailing,23)
                    
                }
                .opacity(showPicker ? 0 : 1)
                VStack{
                    DatePicker("", selection: $date, displayedComponents: [.date]).datePickerStyle(GraphicalDatePickerStyle())
                    Button(action: {
                        showPicker = false
                    }, label: {
                        Text("Done")
                    })
                }.padding(40)
                .opacity(showPicker ? 1 : 0)
                
                    
//                TextField(
//                        "  Enter date and time of incident",
//                    text: $placeHolder
//                ).frame(height:45)
//                .background(Color.white)
//                .border(Color.gray, width: 2)
//                .cornerRadius(4)
//                .padding(.trailing,23)
//                .userInteractionDisabled()
            }
        }
}
struct NoHitTesting: ViewModifier {
    func body(content: Content) -> some View {
        SwiftUIWrapper { content }.allowsHitTesting(false)
    }
}

extension View {
    func userInteractionDisabled() -> some View {
        self.modifier(NoHitTesting())
    }
}

struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
    let content: () -> T
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: content())
    }
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
}

struct testPicker_Previews: PreviewProvider {
    static var previews: some View {
        testPicker()
    }
}
