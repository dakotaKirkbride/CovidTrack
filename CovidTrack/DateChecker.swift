//
//  CheckDataUpdate.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/16/21.
//

import Foundation
import SwiftUI
import CoreData

struct DateChecker {

    func checkForUpdates(viewContext: NSManagedObjectContext) {
        
        // returns string of yesterdays date
        let yesterdaysDate = getYesterdayString()
        // can uncomment the below line for program to check for updates for all three entitities
//        let yesterdaysDate = "2021-05-17"
        checkWorldUpdates(viewContext: viewContext, yesterday: yesterdaysDate)
        checkCountryUpdates(viewContext: viewContext, yesterday: yesterdaysDate)
        checkStateUpdates(viewContext: viewContext, yesterday: yesterdaysDate)
        print("Yesterday's Date: \(yesterdaysDate)")
    }
    
    func checkWorldUpdates(viewContext: NSManagedObjectContext, yesterday: String) {
        // fetch the World entity
        let fetchRequest = NSFetchRequest<World>(entityName: "World")
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Earth")
        
        do {
            let world = try viewContext.fetch(fetchRequest)
            // if there are core data entries for world
            if let aWorld = world.first {
                let wMngr = WorldDataManager(world: aWorld)
                let worldsMostRecentDate = wMngr.mostRecentDate
                print("World Date: \(worldsMostRecentDate)")
                
                if worldsMostRecentDate != yesterday {
                    WorldDate.insertData(context: viewContext)
                    print("checked world csv for updates")
                }
            // no core data entries yet, assume new app build and call insert data method
            } else {
                WorldDate.insertData(context: viewContext)
                print("new app bootup, checked world csv for updates")
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func checkCountryUpdates(viewContext: NSManagedObjectContext, yesterday: String) {
        // fetch US as its the only country in core data
        let fetchRequest = NSFetchRequest<Country>(entityName: "Country")
        fetchRequest.predicate = NSPredicate(format: "name == %@", "United States")
        
        do {
            let country = try viewContext.fetch(fetchRequest)
            // if there are core data entries for country
            if let aCountry = country.first {
                let cMngr = CountryDataManager(country: aCountry)
                let countriesMostRecentDate = cMngr.mostRecentDate
                print("Country Date: \(countriesMostRecentDate)")

                if countriesMostRecentDate != yesterday {
                    CountryDate.insertData(context: viewContext)
                    print("checked country csv for updates")
                }
            // no core data entries yet, assume new app build and call insert data method
            } else {
                CountryDate.insertData(context: viewContext)
                print("new app bootup, checked country csv for updates")
            }

        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func checkStateUpdates(viewContext: NSManagedObjectContext, yesterday: String) {
        // fetch ohio's most recent date (no specific reason for why Ohio is used here)
        let fetchRequest = NSFetchRequest<TheState>(entityName: "TheState")
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Ohio")
        
        do {
            // if there are core data entries for state
            let state = try viewContext.fetch(fetchRequest)
            // if there are core data entries for state
            if let aState = state.first {
                let sMngr = StateDataManager(state: aState)
                let statesMostRecentDate = sMngr.mostRecentDate
                print("State Date: \(statesMostRecentDate)")
                
                if statesMostRecentDate != yesterday {
                    StateDate.insertData(context: viewContext)
                    print("checked state csv for updates")
                }
            // no core data entries yet, assume new app build and call insert data method
            } else {
                StateDate.insertData(context: viewContext)
                print("new app bootup, checked state csv for updates")
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func getYesterdayString() -> String {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        return String("\(year)-\(String(format: "%02d", month))-\(String(format: "%02d", day - 1))")
    }
}
