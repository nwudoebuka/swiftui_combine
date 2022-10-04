//
//  SwiftCombineApp.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 05/10/2022.
//

import SwiftUI

@main
struct SwiftCombineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
