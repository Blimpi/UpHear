//
//  UpHearApp.swift
//  UpHear
//
//  Created by Timothy Ananda on 28/07/21.
//

import SwiftUI
import Firebase

@main
struct UpHearApp: App {
    let persistenceController = PersistenceController.shared
    @State var isSignedIn: Bool = false
    init(){
        FirebaseApp.configure()
    }
//    init() {
//        FirebaseApp.configure()
//        
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
            NewCreateReportView()
        }
    }
}
