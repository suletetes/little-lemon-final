//
//  LittleLemonAppApp.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
