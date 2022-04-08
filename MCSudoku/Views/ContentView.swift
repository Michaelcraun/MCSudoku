//
//  ContentView.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/7/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ZStack {
                // Pen view
                GridView()
                // Pencil View
                GridView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(
                \.managedObjectContext,
                 PersistenceController.preview.container.viewContext)
    }
}
