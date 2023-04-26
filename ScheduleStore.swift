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
        "Carmela Ciria",
        "Jim Heard",
        "Robin Tetley",
        "Kamerum Orun Kingdom"
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
    
    let sessionTimes = [
        "10.00-11.00am",
        "11.30-12.00am",
        "2.00-3.30pm",
        "4.30-5.30pm"
    ]
    
    init() {
        var myIndex = 0
        for _ in 0...9 {
            sessions.append(
                Session(
                    sessionTitle: sessionTitles[myIndex],
                    sessionTime: sessionTimes.randomElement()!,
                    sessionLeader: trainers.randomElement()!,
                    numberOfAttendees: Int(arc4random_uniform(7)),
                    full: Bool.random()))
            
            myIndex += 1

        }
        
        for i in 0...6 {
            days.append(
                ScheduleForDay(
                    id: i + 1,
                    month: months[i],
                    day: daysOfTheWeek[i],
                    sessionsOnThatDay: returnRandomSessions(forThis: Int.random(in: 2..<5)))
            )
        }
        
    }
    
    func returnRandomSessions(forThis: Int) -> [Session] {
        var resultArray = [Session]()
        for _ in 0..<forThis {
            let randomIndex = Int(arc4random_uniform(UInt32(sessions.count)))
            resultArray.append(sessions[randomIndex])
        }
        return resultArray
    }
    
    var sessions: [Session] = []
    
    @Published var days: [ScheduleForDay] = []
}
