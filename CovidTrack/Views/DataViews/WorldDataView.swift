//
//  WorldDataView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/15/21.
//

import SwiftUI
import CoreData
import SwiftUICharts

struct WorldDataView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \World.name, ascending: false)],
        predicate: NSPredicate(format: "name == %@", "Earth"),
        animation: .default)
    private var world: FetchedResults<World>
    
    @State private var navigateToGraphView = false
        
    var body: some View {
        
        let earth = world.first
        let dataMngr = WorldDataManager(world: world.first!)
        
        ZStack {
            NavigationLink("", destination: WorldGraphView(world: earth!), isActive: $navigateToGraphView)
            VStack {
                HStack{Text(earth!.name ?? "").font(.largeTitle).bold(); Spacer(); Image("worldLogo").resizable().scaledToFit().frame(width: 35, height: 35, alignment: .center).padding(.trailing, 20)}
                HStack{Text("Total Cases"); Spacer()}
                HStack{
                    Text("\(dataMngr.todaysCases)").font(.largeTitle)
                    Spacer()
                    casesDifference
                    Text("\(dataMngr.todaysNewCases)").padding(.trailing)
                }
            }
        }
    }
    var casesDifference: some View {
        
        let dataMngr = WorldDataManager(world: world.first!)
        
        if dataMngr.todaysCases > dataMngr.yesterdaysCases {
            return Image(systemName: "arrow.up").foregroundColor(.red)
        } else if dataMngr.todaysCases < dataMngr.yesterdaysCases {
            return Image(systemName: "arrow.down").foregroundColor(.green)
        } else {
            return Image(systemName: "arrow.left").foregroundColor(.gray)
        }
    }
}

