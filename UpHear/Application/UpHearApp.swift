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

    var body: some Scene {
        WindowGroup {
            APITestView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
