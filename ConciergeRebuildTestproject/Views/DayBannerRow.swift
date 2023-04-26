//
//  DayBannerRow.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 24/04/2023.
//

import SwiftUI

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
                if schedule.id == 1 {
                    Image(systemName:
                          "\(schedule.id).circle.fill")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .scaleEffect(1.3)
                } else {
                    Text("\(schedule.id)")
                        .fontWeight(.bold)
                }
                Spacer()
                Text("\(schedule.numberOfSessions)")
                    .foregroundColor(.secondary)
            }
        }
    }
}
