//
//  CountryDataView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 3/30/21.
//

import SwiftUI
import CoreData
import SwiftUICharts

struct CountryDataView: View {
    @Environment(\.managedObjectContext) private var viewContext    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Country.name, ascending: false)],
        predicate: NSPredicate(format: "name == %@", "United States"),
        animation: .default)
    private var countries: FetchedResults<Country>
    
    @State private var navigateToGraphView = false
        
    var body: some View {
        
        let unitedStates = countries.first
        let dataMngr = CountryDataManager(country: countries.first!)
        
        ZStack {
            NavigationLink("", destination: CountryGraphView(country: unitedStates!), isActive: $navigateToGraphView)
            VStack {
                HStack{Text(unitedStates!.name ?? "").font(.largeTitle).bold(); Spacer(); Image("americanFlag").resizable().scaledToFit().frame(width: 40.0, height: 40.0, alignment: .center).padding(.trailing, 20)}
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
        
        let dataMngr = CountryDataManager(country: countries.first!)
        
        if dataMngr.todaysCases > dataMngr.yesterdaysCases {
            return Image(systemName: "arrow.up").foregroundColor(.red)
        } else if dataMngr.todaysCases < dataMngr.yesterdaysCases {
            return Image(systemName: "arrow.down").foregroundColor(.green)
        } else {
            return Image(systemName: "arrow.left").foregroundColor(.gray)
        }
    }
}

