//
//  NewCreateReportView.swift
//  UpHear
//
//  Created by Meichel Rendio on 24/08/21.
//

import SwiftUI

struct NewCreateReportView: View {
    @StateObject var viewModel: CreateReportViewModel = CreateReportViewModel()
    var body: some View {
        NewCreateReportPage(vms: viewModel)
    }
}

struct NewCreateReportView_Previews: PreviewProvider {
    static var previews: some View {
        NewCreateReportView()
    }
}
