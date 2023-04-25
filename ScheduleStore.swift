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
        var myRandonAmount = Int(arc4random_uniform(7))
        var myIndex = 0
        for i in 0...9 {
            sessions.append(
                Session(
                    sessionTitle: sessionTitles[myIndex],
                    sessionTime: "2.00-3.00pm",
                    sessionLeader: trainers.randomElement()!,
                    numberOfAttendees: 4,
                    full: true))
            
            myIndex += 1
            myRandonAmount = Int(arc4random_uniform(7))
//            for session in sessionTitles {
//                days.append(
//                    ScheduleForDay(
//                        id: myIndex,
//                        month: months.randomElement()!,
//                        day: day,
//                        sessionsOnThatDay:[
//                                Session(sessionTitle: session,
//                                        sessionTime: "2.00-3.00pm",
//                                        sessionLeader: trainers.randomElement()!,
//                                        numberOfAttendees: 4,
//                                        full: true)
//                        ]))
//                        myIndex += 1
//            }
        }
        
        for day in daysOfTheWeek {
            days.append(
                ScheduleForDay(
                    id: Int(arc4random_uniform(7)),
                    month: months[0],
                    day: day,
                    sessionsOnThatDay: returnRandomSessions(forThis: Int.random(in: 2..<5)))
            )
        }
        
    }
    
    func returnRandomSessions(forThis: Int) -> [Session] {
//        var resultSet = Set<Session>()
//
//        while resultSet.count < forThis {
//            let randomIndex = Int(arc4random_uniform(UInt32(sessions.count)))
//            resultSet.insert(sessions[randomIndex])
//        }
//
//        let resultArray = Array(resultSet)
//
//        return resultArray
        var resultArray = [Session]()
        for _ in 0..<forThis {
            let randomIndex = Int(arc4random_uniform(UInt32(sessions.count)))
            resultArray.append(sessions[randomIndex])
        }
        return resultArray
//        for i in 0...3 {
//            let myRandomSession = sessions.randomElement()
//        }
    }
    
    var sessions: [Session] = []
    
    @Published var days: [ScheduleForDay] = []
}
