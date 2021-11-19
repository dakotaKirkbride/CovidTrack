//
//  WorldDate.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/15/21.
//

import Foundation
import CoreData
import CSV

extension WorldDate {
    static func insertData(context: NSManagedObjectContext) {
        let world = World(context: context)
        world.name = "Earth"
        let url = URL(string: "https://raw.githubusercontent.com/datasets/covid-19/main/data/worldwide-aggregate.csv")!
        if let data = try? String(contentsOf: url) {
            let csv = try! CSVReader(string: data,hasHeaderRow: true) // It must be true.
            _ = csv.headerRow!
            var previousDayCases = 0
            // print("\(headerRow)") // => ["id", "name"]
            while let row = csv.next() {
                // print("\(row)")
                let newDate = WorldDate(context: context)
                newDate.date = row[0]
                newDate.totalCases = row[1]
                newDate.recovered = row[2]
                newDate.totalDeaths = row[3]
                newDate.newCases = String(Int(row[1])! - previousDayCases)
                newDate.active = String(Int(row[1])! - Int(row[2])! - Int(row[3])!)
                world.addToMyDates(newDate)
                previousDayCases = Int(row[1])!
            }
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
