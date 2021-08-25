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
    @State var isSignedIn: Bool = SignInCache.get()
  
    init() {
        FirebaseApp.configure()
        
        isSignedIn = SignInCache.get()
    }

    var body: some Scene {
        WindowGroup {
            if (isSignedIn == false) {
                AuthView(viewModel: AuthViewModel(mainView: self), mode: .signIn)
//                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            else {
                HomeView(viewModel: HomeViewModel(mainView: self))
            }
        }
    }
}
