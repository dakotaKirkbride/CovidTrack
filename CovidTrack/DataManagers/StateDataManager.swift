//
//  StateDataManager.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/14/21.
//

import Foundation
import SwiftUI
import CoreData

struct StateDataManager {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var state: TheState
    
    var mostRecentDate: String {
        return String(state.dates[0].date!)
    }
        
    var todaysCases: Int {
        return Int(state.dates[0].totalCases!)!
    }
    
    var yesterdaysCases: Int {
        return Int(state.dates[1].totalCases!)!
    }
    
    var todaysNewCases: Int {
        return max(todaysCases - yesterdaysCases, 0)
    }
    
    var yesterdaysNewCases: Int {
        let dayBeforeYesterdayCases = Int(state.dates[2].totalCases!)
        return max(yesterdaysCases - dayBeforeYesterdayCases!, 0)
    }
    
    var caseRatioArray: [Double] {
        // returns array of nums to be used for the case ratio pie chart in WorldGraphView
        var array = [Double]()
        let currentDate = state.dates[0]
        let numAlive = Double(currentDate.totalCases!)! - Double(currentDate.totalDeaths!)!
        let numDead = Double(currentDate.totalCases!)! - numAlive
        array.append(numAlive)
        array.append(numDead)
        
        return array
    }
    
    var weeklyNewCases: [(String, Double)] {
        // returns array of total cases on a weekly basis
        var weeklyNewCases: [(String, Double)] = []
        var index = 0
        for date in state.dates {
            if index % 7 == 0 {
            weeklyNewCases.append((date.date ?? "", Double(getNewCases(datesIndex: index))))
            }
            index += 1
        }
        return weeklyNewCases.reversed()
    }
    
    func getNewCases(datesIndex: Int) -> Double {
        if datesIndex == (state.dates.count - 1) {
            let dayCases = Double(state.dates[datesIndex - 1].totalCases!)
            let prevDayCases = Double(state.dates[datesIndex].totalCases!)
            return max(dayCases! - prevDayCases!, 0)
        } else {
            let dayCases = Double(state.dates[datesIndex].totalCases!)
            let prevDayCases = Double(state.dates[datesIndex + 1].totalCases!)
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
            for _ in state.dates {
                if dataPointsAdded < dataPoints {
                    if (dateInt % 7) == 0 {
                        caseArray.append(getNewCases(datesIndex: dateInt))
                        dataPointsAdded += 1
                    }
                    dateInt += 1
                } else {
                    break
                }
            }
        } else {
            for _ in state.dates {
                if dataPointsAdded < dataPoints {
                    caseArray.append(getNewCases(datesIndex: dateInt))
                    dataPointsAdded += 1
                }
                dateInt += 1
            }
        }
        return caseArray.reversed()
    }
}
