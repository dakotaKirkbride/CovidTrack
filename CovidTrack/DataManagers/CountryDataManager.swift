//
//  CountryDataManger.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/6/21.
//

import SwiftUI
import CoreData
import SwiftUICharts

struct CountryDataManager {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var country: Country

    var mostRecentDate: String {
        return String(country.dates[0].date!)
    }

    var todaysCases: Int {
        return Int(country.dates[0].totalCases!)!
    }
    
//    var todaysVax: Int {
//        return Int(country.dates[0].totalVax!)!
//    }
    
    var yesterdaysCases: Int {
        return Int(country.dates[1].totalCases!)!
    }
    
    var todaysNewCases: Int {
        return max(todaysCases - yesterdaysCases, 0)
    }
    
    var yesterdaysNewCases: Int {
        let dayBeforeYesterdayCases = Int(country.dates[2].totalCases!)
        return max(yesterdaysCases - dayBeforeYesterdayCases!, 0)
    }
    
    var caseRatioArray: [Double] {
        // returns array of nums to be used for the case ratio pie chart in WorldGraphView
        var array = [Double]()
        
        let numAlive = Double((country.dates.first?.alive)!)!
        let numDead = Double((country.dates.first?.totalCases)!)! - numAlive
        
        array.append(numAlive)
        array.append(numDead)
        
        return array
    }
    
    var monthlyTotalCases: [(String, Double)] {
        var monthlyTotalCases: [(String, Double)] = []
        var index = 0
        for date in country.dates {
            if index % 30 == 0 {
                monthlyTotalCases.append((date.date ?? "", Double(date.totalCases!)!))
            }
            index += 1
        }
        return monthlyTotalCases.reversed()
    }
    
    func getNewCases(datesIndex: Int) -> Double {
        if datesIndex == (country.dates.count - 1) {
            let dayCases = Double(country.dates[datesIndex].totalCases!)
            let prevDayCases = Double(0)
            return dayCases! - prevDayCases
        } else {
            let dayCases = Double(country.dates[datesIndex].totalCases!)
            let prevDayCases = Double(country.dates[datesIndex + 1].totalCases!)
            return max(dayCases! - prevDayCases!, 0)
        }
    }
        
    func getNewCaseArray(dataPoints: Int, weeklyBasis: Bool) -> [Double] {
        // returns new case array for given dates based on the parameters passed
        // dataPoints = num of dates for which new cases will displayed
        // weeklyBasis = if true, returns array of dates (len datapoints) on a weekly basis
        var caseArray = [Double]()
        var dateInt = 0
        var dataPointsAdded = 0
        
        if weeklyBasis {
            for cDate in country.dates {
                if dataPointsAdded < dataPoints {
                    if (dateInt % 7) == 0 {
                        let tempVal = Double(cDate.newCases!)
                        caseArray.append(tempVal!)
                        dataPointsAdded += 1
                    }
                    dateInt += 1
                } else {
                    break
                }
            }
        } else {
            for cDate in country.dates {
                if dataPointsAdded < dataPoints {
                    let tempVal = Double(cDate.newCases!)
                    caseArray.append(tempVal!)
                    dataPointsAdded += 1
                }
                dateInt += 1
            }
        }
        return caseArray.reversed()
    }
}
