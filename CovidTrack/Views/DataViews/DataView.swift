//
//  DataView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/9/21.
//

import Foundation
import SwiftUI


struct DataView: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section { WorldDataView()}
                    Section { CountryDataView()}
                    Section { StateDataView()}
                }
            }
            .navigationBarTitle("COVID-19 Dashboard")
//            .navigationBarHidden(true)
        }
        .onAppear() {
            UIScrollView.appearance().backgroundColor = UIColor.systemGroupedBackground
        }
    }
}
