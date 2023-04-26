//
//  CalendarScrollPicker.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 26/04/2023.
//

import SwiftUI

struct CalendarScrollPicker: View {
    
    var day: String
    var date: Int
    
    var body: some View {
        VStack {
           // Spacer()
            Text(day)
            Image(systemName:"\(date).circle.fill")
        }
        //.edgesIgnoringSafeArea(.top)
    }
}

//struct CalendarScrollPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarScrollPicker()
//    }
//}
