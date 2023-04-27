//
//  ScrollingCalendarData.swift
//  ConciergeRebuildTestproject
//
//  Created by robin tetley on 27/04/2023.
//

import Foundation

struct ScrollingCalendarModel: Hashable, Identifiable{
    var dayName: String
    var date: Int
    var id : Int
    var isSelected = false
}
