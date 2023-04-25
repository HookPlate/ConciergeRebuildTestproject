//
//  SessionRow.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 24/04/2023.
//

import SwiftUI

struct SessionRow: View {
    
    var session: Session
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(session.sessionTitle)
            Text(session.sessionTime)
                .foregroundColor(.secondary)
            Text(session.sessionLeader)
                .foregroundColor(.secondary)
            HStack {
                Text("\(session.numberOfAttendees)")
                    .fontWeight(.bold)
                Spacer()
                Text(session.full ? "Full" : "")
                    .foregroundColor(.secondary)
            }
        }
    }
}

