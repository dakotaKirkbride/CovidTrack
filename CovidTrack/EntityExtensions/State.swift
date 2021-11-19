//
//  State.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/8/21.
//

import Foundation
import CoreData

// got help during in class breakout room time with below code that creates an array of all state date objects for each respective state
extension TheState {
    var dates: [StateDate] {
        if let d = myDates as? Set<StateDate> {
            return Array(d).sorted(by: {$0.date! > $1.date!})
        } else {
            return []
        }
    }
}
