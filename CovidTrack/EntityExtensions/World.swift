//
//  World.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/15/21.
//

import Foundation
import CoreData

extension World {
    var dates: [WorldDate] {
        if let d = myDates as? Set<WorldDate> {
            return Array(d).sorted(by: {$0.date! > $1.date!})
        } else {
            return []
        }
    }
}
