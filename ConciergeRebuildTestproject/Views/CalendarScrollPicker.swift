//
//  CalendarScrollPicker.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 26/04/2023.
//

import SwiftUI

struct CalendarScrollPicker: View {
    
//    var day: String
//    var date: Int
   //  @Binding var isSelected: Bool
      var day: CalendarDataForDay
    
    var body: some View {
        VStack {
           // Spacer()
            Text(day.dayName)
            Image(systemName: day.isSelected ? "\(day.date).circle.fill": "\(day.date).circle")
        }
        //.edgesIgnoringSafeArea(.top)
    }
}

//struct CalendarScrollPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarScrollPicker()
//    }
//}
