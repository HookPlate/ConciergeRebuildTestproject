//
//  ContentView.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 20/04/2023.


import SwiftUI
struct CalendarDataForDay: Hashable, Identifiable{
    var dayName: String
    var date: Int
    var id = UUID()
    var isSelected = false
    
//    static func < (lhs: CalendarDataForDay, rhs: CalendarDataForDay) -> Bool {
//            lhs.dayName < rhs.dayName
//        }
}

struct ContentView: View {
    
    @EnvironmentObject var scheduleStore: ScheduleStore
    @State private var currentIndex = 0
   // var calendarDays: [CalendarDataForDay] = []
    @State private var isDateSelected  = false
   // var previouslySelectedDay: CalendarDataForDay = CalendarDataForDay(dayName: daysOfTheWeek[0], date: 2)
    
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
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        
//        for i in 0..<7 {
//            calendarDays.append(CalendarDataForDay(dayName: daysOfTheWeek[i], date: i))
//        }
       // previouslySelectedDay = CalendarDataForDay(dayName: daysOfTheWeek[0], date: 2)
    }
    
    var body: some View {
      
        NavigationStack {
           
                GeometryReader { geo in
                    ScrollViewReader { scrollView in
                        VStack {
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
//                        Spacer()

                       
                        
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
                            ScrollView(.horizontal) {
                                                                LazyHStack {
                                                                    ForEach($scheduleStore.calendarDays) { $day in
                                                                        let myDay = day
                                                                        CalendarScrollPicker(day: day)
                                                                            .padding(8)
                                                                            .onTapGesture {
                                                                                
                                                                                withAnimation {
                                                                                    scrollView.scrollTo(day.date)
                                                                                    //day.toggle()
                                                                                    day.isSelected.toggle()
                                                                                   // previouslySelectedDay = day
                                                                                    scheduleStore.deselectDay(day: myDay)
                                                                                }
                                                                            }
                                                                    }
                                                                    
                                                                }
                                                                
                                 }
                            .frame(height: geo.size.height / 15)
//                        HStack {
//                            StepToStartButton(days: scheduleStore.days, currentIndex: $currentIndex, scrollView: scrollView)
//                            StepBackwardOneButton(days: scheduleStore.days, currentIndex: $currentIndex, scrollView: scrollView)
//                            StepForwardOneButton(days: scheduleStore.days, currentIndex: $currentIndex, scrollView: scrollView)
//                            StepToEndButton(days: scheduleStore.days, currentIndex: $currentIndex, scrollView: scrollView)
//                        }
                        
                        //scrollview above,reader below
                           // ScrollViewReader { scrollView in
                            
                           // }
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
