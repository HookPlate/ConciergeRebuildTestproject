//
//  ContentView.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 20/04/2023.


import SwiftUI

struct Session: Hashable {
    var sessionTitle: String
    var sessionTime: String
    var sessionLeader: String
    var numberOfAttendees: Int
    var full: Bool
}

struct ScheduleForDay: Identifiable, Hashable {
    var id: Int
    var month: String
    var day: String
    var numberOfSessions: Int {
        sessionsOnThatDay.count
    }
    var sessionsOnThatDay: [Session]
}


struct SessionRow: View {
    var session: Session
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(session.sessionTitle)
            Text(session.sessionTime)
                .foregroundColor(.secondary)
            Text(session.sessionLeader)
                .foregroundColor(.secondary)
            HStack {
                Text("\(session.numberOfAttendees)")
                    .fontWeight(.bold)
                Spacer()
                Text(session.full ? "Full" : "")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct DayBannerRow: View {
    var schedule: ScheduleForDay
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Spacer()
            Text(schedule.month)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            HStack {
                Text(schedule.day)
                    .fontWeight(.bold)
                Image(systemName: "\(schedule.id).circle.fill").foregroundColor(.blue)
                    .fontWeight(.bold)
                    .scaleEffect(1.3)
                Spacer()
                Text("\(schedule.numberOfSessions)")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView: View {
    @State private var isShowingCrew = false
    @State private var currentIndex = 0
    var days: [ScheduleForDay]
    var session = Session(sessionTitle: "Getting started on iPad", sessionTime: "10.00", sessionLeader: "Robin", numberOfAttendees: 3, full: false)
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        days = [
            ScheduleForDay(
                id: 0,
                month: "Jan",
                day: "Mon",
                sessionsOnThatDay:[
                    Session(
                        sessionTitle: "Getting started on iPad",
                        sessionTime: "10.00",
                        sessionLeader: "Robin",
                        numberOfAttendees: 3,
                        full: false),
                    Session(
                        sessionTitle: "Getting started on iPad",
                        sessionTime: "10.00",
                        sessionLeader: "Robin",
                        numberOfAttendees: 3,
                        full: false),
                    Session(
                        sessionTitle: "Getting started on iPad",
                        sessionTime: "10.00",
                        sessionLeader: "Robin",
                        numberOfAttendees: 3,
                        full: false),
                    Session(
                        sessionTitle: "Getting started on iPad",
                        sessionTime: "10.00",
                        sessionLeader: "Robin",
                        numberOfAttendees: 3,
                        full: false)
                
                ]),
            ScheduleForDay(
                id: 1,
                month: "Feb",
                day: "Tues",
                sessionsOnThatDay: [
                    Session(
                        sessionTitle: "Getting started on iPhone",
                        sessionTime: "10.00",
                        sessionLeader: "Jim",
                        numberOfAttendees: 4,
                        full: false),
                    Session(
                        sessionTitle: "Getting started on iPhone",
                        sessionTime: "10.00",
                        sessionLeader: "Jim",
                        numberOfAttendees: 4,
                        full: false),
                    Session(
                        sessionTitle: "Getting started on iPhone",
                        sessionTime: "10.00",
                        sessionLeader: "Jim",
                        numberOfAttendees: 4,
                        full: false)
                ]),
            ScheduleForDay(
                id: 2,
                month: "Feb",
                day: "Tues",
                sessionsOnThatDay: [
                    Session(
                        sessionTitle: "Getting started on iPhone",
                        sessionTime: "10.00",
                        sessionLeader: "Jim",
                        numberOfAttendees: 4,
                        full: false)
                ])
        ]
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(days.indices) { index in
                                List {
                                    DayBannerRow(schedule: days[index])
                                    ForEach(days[index].sessionsOnThatDay, id: \.self) { session in
                                        SessionRow(session: session)
                                    }
                                    
                    
                                    
                                }
                                .frame(width: geo.size.width - 10, height: geo.size.height - 15)
                                .id(index)
                                .padding(5)
                            }
                        }
                    }
                    HStack {
                        Button(action: {
                            withAnimation {
                                currentIndex = (currentIndex == 0) ? currentIndex + 0 : currentIndex - 1
                                scrollView.scrollTo(currentIndex,anchor: .leading)
                            }
                        }) {
                            Image(systemName: "arrowtriangle.backward.circle")
                                .font(.system(size: 50))
                                .foregroundColor(.secondary)
                        }
                        Button(action: {
                            withAnimation {
                                currentIndex = (currentIndex == days.count - 1) ? currentIndex : currentIndex + 1
                                print("Scrolling forwards")
                                scrollView.scrollTo(currentIndex,anchor: .leading)
                            }
                        }) {
                            Image(systemName: "arrowtriangle.forward.circle")
                                .font(.system(size: 50))
                                .foregroundColor(.secondary)
                        }
                        .navigationBarItems(trailing: Toggle(isOn: $isShowingCrew, label: {
                            Text("Crew")
                        }))
                        .navigationBarItems(leading: Toggle(isOn: $isShowingCrew, label: {
                            Text("Filter")
                        }))
                        .navigationBarItems(leading: Toggle(isOn: $isShowingCrew, label: {
                            Image(systemName: "magnifyingglass")
                        }))
                        
                        .navigationBarTitle("SouthGate")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                    
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
