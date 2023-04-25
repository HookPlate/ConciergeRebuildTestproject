//
//  ContentView.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 20/04/2023.


import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var scheduleStore: ScheduleStore
    @State private var currentIndex = 0
  //  var days: [ScheduleForDay]
    var session = Session(sessionTitle: "Getting started on iPad", sessionTime: "10.00", sessionLeader: "Robin", numberOfAttendees: 3, full: false)
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(scheduleStore.days.indices) { index in
                                List {
                                    DayBannerRow(schedule: scheduleStore.days[index])
                                    ForEach(scheduleStore.days[index].sessionsOnThatDay, id: \.self) { session in
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
                        StepBackwardOneButton(days: scheduleStore.days, currentIndex: $currentIndex, scrollView: scrollView)
                        StepForwardOneButton(days: scheduleStore.days, currentIndex: $currentIndex, scrollView: scrollView)
                    }
                    .navigationBarTitle("SouthGate")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                print("Done tapped!")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                print("Done tapped!")
                            } label: {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Filter") {
                                print("Done tapped!")
                            }
                        }
                        
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
