//
//  APITestView.swift
//  UpHear
//
//  Created by Timothy Ananda on 01/08/21.
//

import SwiftUI

struct APITestView: View {
    
    @ObservedObject var viewModel = APITestViewModel()
    
    var body: some View {
        List {
            ForEach((viewModel.userData?.records ?? [UserDataResponse]()), content: {
                userDataResponse in
                TestItemView(title: (userDataResponse.fields?.name)!)
            })
        }
    }
}

struct TestItemView: View {
    let title: String
    
    var body: some View {
        Text(title)
    }
    
}

struct APITestView_Previews: PreviewProvider {
    static var previews: some View {
        APITestView()
        
        APITestView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}
