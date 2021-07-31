//
//  HomeView.swift
//  UpHear
//
//  Created by Timothy Ananda on 29/07/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedSegment:segment = .onGoing
    
    var body: some View {
        NavigationView{
            VStack{
                Picker("Choose status", selection: $selectedSegment){
                    ForEach(segment.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                ChosenSegment(selectedSegment: selectedSegment)
                
            }
        }.navigationTitle("My Cases")
    }
}

enum segment: String, CaseIterable{
    case onGoing = "OnGoing"
    case closed = "Closed"
}


struct ChosenSegment: View{
    var selectedSegment: segment
    
    var body: some View{
        switch selectedSegment{
        case .onGoing:
            onGoingCasesView()
            
        case .closed:
            closedCasesView()
        }
    }
}


struct onGoingCasesView: View{
    var body: some View{
        Text("Ini view buat onGoing Cases")
    }
}

struct closedCasesView: View{
    var body: some View{
        Text("Ini view buat closed Cases")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
