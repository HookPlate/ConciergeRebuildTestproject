//
//  StepToStartButton.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 26/04/2023.
//

import SwiftUI

struct StepToStartButton: View {
    
    var days: [ScheduleForDay]
    @Binding var currentIndex: Int
    let scrollView: ScrollViewProxy
    
    var body: some View {
        Button(action: {
            withAnimation {
                scrollView.scrollTo(0)
            }
        }) {
            Image(systemName: "backward.end.fill")
                .font(.system(size: 50))
                .foregroundColor(.black)
                .opacity(0.6)
                //.scaleEffect(0.6)
            //I thought about having the opacity increase once they scroll away from the start, to imply to the user that the button had become active but I realise it would look odd since it would only make sense on the leading button. 
        }
    }
}
