//
//  StepForwardOneButton.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 24/04/2023.
//

import SwiftUI

struct StepForwardOneButton: View {
    
    var days: [ScheduleForDay]
    @Binding var currentIndex: Int
    let scrollView: ScrollViewProxy
  
    
    var body: some View {
        Button(action: {
            withAnimation {
                currentIndex = (currentIndex == days.count - 1) ? currentIndex : currentIndex + 1
                print("Scrolling forwards")
                scrollView.scrollTo(currentIndex,anchor: .leading)
            }
        }) {
            Image(systemName: "arrowtriangle.forward.circle")
                .font(.system(size: 50))
                .foregroundColor(.accentColor)
                .opacity(0.8)
        }
    }
}

