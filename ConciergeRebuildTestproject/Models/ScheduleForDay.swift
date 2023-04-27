//
//  ScheduleForDay.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 24/04/2023.
//

import Foundation

struct ScheduleForDay: Identifiable, Hashable {
    var id: Int
    var month: String
    var day: String
    var numberOfSessions: Int {
        sessionsOnThatDay.count
    }
    var sessionsOnThatDay: [Session]
}
