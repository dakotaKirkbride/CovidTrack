//
//  CountryDate.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 3/30/21.
//

import Foundation
import CoreData
import CSV

extension CountryDate {
    static func insertData(context: NSManagedObjectContext) {
        var previousDayCases = 0
        let newCountry = Country(context: context)
        newCountry.name = "United States"
        // template for accessing csv data provided in the csv package documentation
        let url = URL(string: "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv")!
        if let data = try? String(contentsOf: url) {
            let csv = try! CSVReader(string: data,hasHeaderRow: true) // It must be true.
            _ = csv.headerRow!
            while let row = csv.next() {
                let newDate = CountryDate(context: context)
                newDate.date = row[0]
                newDate.totalCases = row[1]
                newDate.totalDeaths = row[2]
                newDate.newCases = String(Int(row[1])! - previousDayCases)
                newDate.alive = String(Int(row[1])! - Int(row[2])!)
                newCountry.addToMyDates(newDate)
                previousDayCases = Int(row[1])!
            }
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
//        attempted to add vaccination data for the US, but it seemed to merge the data with total cases, will need to look further into why
//        let vaxURL = URL(string: "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/country_data/United%20States.csv")!
//        if let vaxData = try? String(contentsOf: vaxURL) {
//            let vaxCsv = try! CSVReader(string: vaxData, hasHeaderRow: true)
//            _ = vaxCsv.headerRow!
//            while let row = vaxCsv.next() {
//                let newDate = CountryDate(context: context)
//                newDate.date = row[1]
//                newDate.totalVax = row[4]
//                newDate.totalPeopleVax = row[6]
//                
//            }
//        }
    }
}
