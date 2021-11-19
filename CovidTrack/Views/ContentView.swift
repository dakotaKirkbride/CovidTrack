//
//  ContentView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 3/30/21.
//

import SwiftUI
import CoreData
import CSV

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var showSelectStateView = false
    
   var body: some View {
       TabView {
               DataView()
                   .tabItem {
                    Image(systemName: "waveform.path.ecg")
               }
               ScreeningView()
                   .tabItem {
                       Image(systemName: "staroflife")
               }
               AboutView()
                   .tabItem {
                       Image(systemName: "info.circle")
               }
               MoreInfoView()
                   .tabItem {
                       Image(systemName: "ellipsis.circle")
               }
           }
       .onAppear() {
        let dateChecker = DateChecker()
        dateChecker.checkForUpdates(viewContext: viewContext)
       }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

