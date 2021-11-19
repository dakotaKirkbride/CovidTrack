//
//  SelectStateView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/9/21.
//

import Foundation
import SwiftUI
import CoreData

struct SelectStateView: View {
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TheState.name, ascending: true)],
        animation: .default)
    private var states: FetchedResults<TheState>

    @State private var selection: Int = 0
    @ObservedObject var visibleState: StateDataViewSelection
    
    var body: some View {

        NavigationView {
            VStack {
                Picker("Select State", selection: $selection) {
                    ForEach(states.indices, id: \.self) { idx in
                        Text(states[idx].name ?? "")
                            .tag(idx)
                    }.scaleEffect(x: 1.5, y: 1.5)
                }
                .onChange(of: selection, perform: { value in
//                    visibleState.selectedState = states[value]
                    print ("selected", states[value])
                })
//                .onDisappear() {
//                    visibleState.selectedState = states[selection]
//                    print("on dismiss: selected", states[selection])
//                }
                .navigationBarTitle("Select State", displayMode: .inline)
                .navigationBarItems(
                    leading: Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()},
                    trailing: Button("Done") {
                        visibleState.selectedState = states[selection]
                        presentationMode.wrappedValue.dismiss()
                    })
            }
        }
    }
}

