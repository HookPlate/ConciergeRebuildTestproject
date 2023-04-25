//
//  ScheduleStore.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 25/04/2023.
// Your ViewModel

import Foundation

class ScheduleStore: ObservableObject {
    
    
    let sessionTitles = [
        "Personalising your Apple Watch",
        "Getting Started with iPad",
        "Managing Family Devices",
        "Create Powerful Presentations in Keynote",
        "Your Kids and Their Devices",
        "Getting Started with iPhone",
        "Simplify Your Day with iPhone",
        "Managing Your Screen Time",
        "Getting Started with Magic Keyboard for iPad",
        "Getting Started with Mac"
    ]
    
    let trainers = [
        "Carmela",
        "Jim",
        "Robin",
        "Kamerum"
    ]
    
    let months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
    ]
    
    let daysOfTheWeek = [
        "Mon",
        "Tues",
        "Wed",
        "Thur",
        "Fri",
        "Sat",
        "Sun"
    ]
    
    init() {
        var myIndex = 0
        for day in daysOfTheWeek {
            for session in sessionTitles {
                days.append(
                    ScheduleForDay(
                        id: myIndex,
                        month: months.randomElement()!,
                        day: day,
                        sessionsOnThatDay:[
                                Session(sessionTitle: session,
                                        sessionTime: "2.00-3.00pm",
                                        sessionLeader: trainers.randomElement()!,
                                        numberOfAttendees: 4,
                                        full: true)
                        ]))
                        myIndex += 1
            }
        }
    }
    
    @Published var days: [ScheduleForDay] = []
}
