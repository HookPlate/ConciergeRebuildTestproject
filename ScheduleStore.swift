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
        "Tim Cook",
        "Eddie Cue",
        "Craig Federighi",
        "Phil Schiller",
        "Steve Wozniak",
        "Deirdre O'Brien",
        "Lisa Jackson",
        "John Ternus",
        "Robin Tetley",
        "Jeff Williams"
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
        //sessions must be full before we append to days.
        for i in 0...9 {
            sessions.append(
                Session(
                    sessionTitle: sessionTitles[i],
                    sessionTime: sessionTimes.randomElement()!,
                    sessionLeader: trainers[i],
                    numberOfAttendees: Int(arc4random_uniform(7)),
                    full: Bool.random()))
        }
        
        for i in 0...6 {
            days.append(
                ScheduleForDay(
                    id: i + 1,
                    month: months[0],
                    day: daysOfTheWeek[i],
                    sessionsOnThatDay: returnRandomSessions(forThis: Int.random(in: 2..<5))))
            
        }
        
        for i in 0..<7 {
            calendarDays.append(CalendarDataForDay(dayName: daysOfTheWeek[i], date: i, id: i))
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
    
    var previouslySelectedDay = 0
    
    func deselectDay(dayIndex: Int) {
//        calendarDays[0].dayName = "New"
        calendarDays[previouslySelectedDay].isSelected = false
        calendarDays[dayIndex].isSelected = true
        previouslySelectedDay = dayIndex
       // calendarDays.first(where: { $0.id == id })?.isSelected = false
     //   let myNewDay = calendarDays.filter {$0.id == id}
    }
    
    var sessions: [Session] = []
    
    @Published var days: [ScheduleForDay] = []
    
    @Published var calendarDays: [CalendarDataForDay] = []
}
