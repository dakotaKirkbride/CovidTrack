//
//  WorldDataManager.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/15/21.
//

import SwiftUI
import CoreData
import SwiftUICharts

struct WorldDataManager {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var world: World

    var mostRecentDate: String {
        return String(world.dates[0].date!)
    }
    
    var todaysDate: String {
        return String(world.dates[0].date!)
    }
    
    var todaysCases: Int {
        return Int(world.dates[0].totalCases!)!
    }
    
    var yesterdaysCases: Int {
        return Int(world.dates[1].totalCases!)!
    }
    
    var todaysNewCases: Int {
        return Int(world.dates[0].newCases!)!
    }
    
    var yesterdaysNewCases: Int {
        return Int(world.dates[1].newCases!)!
    }
    
    var caseRatioArray: [Double] {
        // returns array of nums to be used for the case ratio pie chart in WorldGraphView
        var array = [Double]()
        
        let numActive = Double((world.dates[0].active)!)!
        let numRecovered = Double((world.dates[0].recovered)!)!
        let numDead = Double(todaysCases) - numActive - numRecovered
        
        array.append(numActive)
        array.append(numRecovered)
        array.append(numDead)
        
        return array
    }
    
    var monthlyTotalCases: [(String, Double)] {
        // returns array of total cases on a monthly basis
        var monthlyTotalCases: [(String, Double)] = []
        var index = 0
        for date in world.dates {
            if index % 30 == 0 {
                monthlyTotalCases.append((date.date ?? "", Double(date.totalCases!)!))
            }
            index += 1
        }
        return monthlyTotalCases.reversed()
    }
    
    func getNewCases(datesIndex: Int) -> Int {
        // gets new cases for the date index passed
        return Int(world.dates[datesIndex].newCases!)!
    }
    
    func getNewCaseArray(dataPoints: Int, weeklyBasis: Bool) -> [Double] {
        // returns new case array for given dates based on the parameters passed
        // dataPoints = num of dates for which new cases will displayed
        // weeklyBasis = if true, returns array of dates (len datapoints) on a weekly basis
        var caseArray = [Double]()
        var dateInt = 0
        var dataPointsAdded = 0
        
        if weeklyBasis {
            for wDate in world.dates {
                if dataPointsAdded < dataPoints {
                    if (dateInt % 7) == 0 {
                        let tempVal = Double(wDate.newCases!)
                        caseArray.append(tempVal!)
                        dataPointsAdded += 1
                    }
                    dateInt += 1
                } else {
                    break
                }
            }
        } else {
            for wDate in world.dates {
                if dataPointsAdded < dataPoints {
                    let tempVal = Double(wDate.newCases!)
                    caseArray.append(tempVal!)
                    dataPointsAdded += 1
                }
                dateInt += 1
            }
        }
        return caseArray.reversed()
    }
}
