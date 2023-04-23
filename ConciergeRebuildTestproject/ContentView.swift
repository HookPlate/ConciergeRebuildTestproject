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
    var numberOfSessions: Int
    var sessionsOnThatDay: [Session]
}


struct TaskRow: View {
    var sessions: [Session]
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(sessions[0].sessionTitle)
            Text(sessions[0].sessionTime)
                .foregroundColor(.secondary)
            Text(sessions[0].sessionLeader)
                .foregroundColor(.secondary)
            HStack {
                Text("\(sessions[0].numberOfAttendees)")
                    .fontWeight(.bold)
                Spacer()
                Text(sessions[0].full ? "Full" : "")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct TitleRow: View {
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
            ScheduleForDay(id: 13, month: "Jan", day: "Mon", numberOfSessions: 3, sessionsOnThatDay: [Session(sessionTitle: "Getting started on iPad", sessionTime: "10.00", sessionLeader: "Robin", numberOfAttendees: 3, full: false)]),
            ScheduleForDay(id: 14, month: "Feb", day: "Tues", numberOfSessions: 5, sessionsOnThatDay: [Session(sessionTitle: "Getting started on iPad", sessionTime: "10.00", sessionLeader: "Robin", numberOfAttendees: 3, full: false)])
        ]
             }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(days, id: \.self) { day in
                                List {
                                    Section {
                                        TitleRow(schedule: day)
                                        TaskRow(sessions: day.sessionsOnThatDay)
//                                        TaskRow()
//                                        TaskRow()
                                    }
                                }
                                .frame(width: geo.size.width - 10, height: geo.size.height - 15)
                                .id(day)
                                .padding(5)
                            }
                        }
                    }
                    HStack {
                        Button(action: {
                            withAnimation(.linear(duration: 2)) {
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
                                currentIndex = (currentIndex == 0) ? currentIndex + 2 : currentIndex + 1
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
