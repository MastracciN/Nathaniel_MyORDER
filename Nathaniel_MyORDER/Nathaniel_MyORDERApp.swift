//
//  Nathaniel_MyORDERApp.swift
//  Nathaniel_MyORDER
//
//  mastracn - 991367889
//  Nathaniel Mastracci
//
//  Created by user929441 on 9/30/21.
//

import SwiftUI

@main
struct Nathaniel_MyORDERApp: App {
    let persistenceController = PersistenceController.shared
    let coreDBHelper = CoreDBHelper(context: PersistenceController.shared.container.viewContext)
    
    var body: some Scene {
        WindowGroup {
            OrderView()
                .environmentObject(coreDBHelper)
        }
    }
}
