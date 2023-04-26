//
//  StepToEndButton.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 26/04/2023.
//

import SwiftUI

struct StepToEndButton: View {
    
    var days: [ScheduleForDay]
    @Binding var currentIndex: Int
    let scrollView: ScrollViewProxy
    
    var body: some View {
        Button(action: {
            withAnimation {
                scrollView.scrollTo(days.count - 1)
            }
        }) {
            Image(systemName: "forward.end.fill")
                .font(.system(size: 50))
                .foregroundColor(.accentColor)
                .opacity(0.8)
                .scaleEffect(0.6)
        }
    }
}
