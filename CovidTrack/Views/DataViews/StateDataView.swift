//
//  StateDataView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/7/21.
//

import SwiftUI
import CoreData
import Foundation

struct StateDataView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TheState.name, ascending: true)],
        animation: .default)
    private var states: FetchedResults<TheState>
    
    @State private var showSelectStateView = false
    @StateObject private var visibleState = StateDataViewSelection()
    
    @State private var navigateToGraphView = false
    
    var state: TheState { visibleState.selectedState ?? states.first! }
    
    var body: some View {
        let todaysCases = Int((state.dates[0].totalCases)!)
        let yesterdaysCases = Int((state.dates[1].totalCases)!)
        let dailyDifference = todaysCases! - yesterdaysCases!

        ZStack {
            NavigationLink("", destination: StateGraphView(state: state), isActive: $navigateToGraphView)
            VStack {
                HStack{
                    Text(state.name ?? "").font(.largeTitle).bold()
                    Button {}
                        label: {
                        Image(systemName: "arrowtriangle.down.fill")
                    }
                    .onTapGesture {
                        showSelectStateView = true
                    }
                    Spacer()}
                HStack{Text("Total Cases"); Spacer()}
                HStack{
                    Text("\(todaysCases!)").font(.largeTitle)
                    Spacer()
                    casesDifference
                    Text("\(dailyDifference)").padding(.trailing)
                }
            }
        .sheet(isPresented: $showSelectStateView) {
            SelectStateView(visibleState: visibleState)
                .environment(\.managedObjectContext, viewContext)
            }
        }
    }
    
    var casesDifference: some View {
        
        let dataMngr = StateDataManager(state: state)
        
        if dataMngr.todaysCases > dataMngr.yesterdaysCases {
            return Image(systemName: "arrow.up").foregroundColor(.red)
        } else if dataMngr.todaysCases < dataMngr.yesterdaysCases {
            return Image(systemName: "arrow.down").foregroundColor(.green)
        } else {
            return Image(systemName: "arrow.left").foregroundColor(.gray)
        }
    }
}

class StateDataViewSelection: ObservableObject {
    @Published var selectedState: TheState? = nil
}
