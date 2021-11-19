//
//  Country.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/9/21.
//

import Foundation
import CoreData

// got help during in class breakout room time with below code that creates an array of all country date objects for each respective country
extension Country {
    var dates: [CountryDate] {
        if let d = myDates as? Set<CountryDate> {
            return Array(d).sorted(by: {$0.date! > $1.date!})
        } else {
            return []
        }
    }
}
