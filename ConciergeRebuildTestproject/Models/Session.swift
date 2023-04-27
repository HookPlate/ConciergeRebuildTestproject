//
//  Session.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 24/04/2023.
//

import Foundation

struct Session: Hashable {
    var sessionTitle: String
    var sessionTime: String
    var sessionLeader: String
    var numberOfAttendees: Int
    var full: Bool
}
