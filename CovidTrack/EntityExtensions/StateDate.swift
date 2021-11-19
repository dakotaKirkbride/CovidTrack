//
//  StateDate.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/6/21.
//

import Foundation
import CoreData
import CSV

extension StateDate {
    static func insertData(context: NSManagedObjectContext) {
        let url = URL(string: "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")!
        
        // Only want to add data from the last 3 months
        // get current data
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        var within3Months = false

        
        if let data = try? String(contentsOf: url) {
            let csv = try! CSVReader(string: data, hasHeaderRow: true)
            let _ = csv.headerRow!
            while let row = csv.next() {
                // if the row begins with current year and two months ago, or within3Months has already been set to true
                if (row[0].hasPrefix("\(year)-\(String(format: "%02d", month - 2))")) || within3Months {
                    let newState = TheState(context: context)
                    newState.name = row[1]
                    let newDate = StateDate(context: context)
                    newDate.date = row[0]
                    newDate.name = row[1]
                    newDate.totalCases = row[3]
                    newDate.totalDeaths = row[4]
                    newState.addToMyDates(newDate)
                    within3Months = true
                }
            }
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
