//
//  CovidTrackApp.swift
//  CovidTrack
//
//
//  Created by Dakota Kirkbride on 3/30/21.
//

//import SwiftUI
//
//@main
//struct CovidTrackApp: App {
//    let persistenceController = PersistenceController.shared
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
//    }
//}

import SwiftUI

@main
struct CoreDataSwiftUIDemoApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {

            case .background:
                do {
                    try persistenceController.container.viewContext.save()
                } catch {
                    print("error saving")
                }
            case .inactive:
                break
            case .active:
                break
            @unknown default:
                break
            }
        }
    }
}
