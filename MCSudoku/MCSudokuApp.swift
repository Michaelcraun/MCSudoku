//
//  MCSudokuApp.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/7/22.
//

import SwiftUI

@main
struct MCSudokuApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
