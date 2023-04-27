//
//  StepBackwardOneButton.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 24/04/2023.
//

import SwiftUI

struct StepBackwardOneButton: View {
    
    var days: [ScheduleForDay]
    @Binding var currentIndex: Int
    let scrollView: ScrollViewProxy
    
    var body: some View {
        Button(action: {
            withAnimation {
                currentIndex = (currentIndex == 0) ? currentIndex + 0 : currentIndex - 1
                scrollView.scrollTo(currentIndex,anchor: .leading)
            }
        }) {
            Image(systemName: "arrowtriangle.backward.circle")
                .font(.system(size: 50))
                .foregroundColor(.black)
                .opacity(0.6)
        }
    }
}

