//
//  UpHearApp.swift
//  UpHear
//
//  Created by Timothy Ananda on 28/07/21.
//

import SwiftUI

@main
struct UpHearApp: App {
    let persistenceController = PersistenceController.shared
    @State var isSignedIn: Bool = true
//
//    init() {
//        if UserProfileCache.getId() != nil {
//            isSignedIn = true
//        }
//        else {
//            isSignedIn = false
//        }
//    }

    var body: some Scene {
        WindowGroup {
//            if (isSignedIn == false) {
//                AuthView(viewModel: AuthViewModel(mainView: self), mode: .signIn)
////                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            }
//            else {
//                HomeView()
//            }
            UserProfileView()
        }
    }
}
