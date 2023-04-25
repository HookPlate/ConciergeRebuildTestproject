//
//  ConciergeRebuildTestprojectApp.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 20/04/2023.
//

import SwiftUI

@main
struct ConciergeRebuildTestprojectApp: App {
    @StateObject var scheduleStore = ScheduleStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(scheduleStore)
        }
    }
}
