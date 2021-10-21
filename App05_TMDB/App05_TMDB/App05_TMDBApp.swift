//
//  App05_TMDBApp.swift
//  App05_TMDB
//
//  Created by Alumno on 27/09/21.
//

import SwiftUI

@main
struct App05_TMDBApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            TMDBView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
