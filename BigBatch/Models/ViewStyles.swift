//
//  ViewStyles.swift
//  BigBatch
//
//  Created by James on 12/10/22.
//

import Foundation


enum ViewStyles: Int {
    case cocktailSpecs
    case savedBatches
    case batchScreen
    
    var name: String {
        switch self {
        case .cocktailSpecs:
            return NSLocalizedString("Today", comment: "Today style name")
        case .savedBatches:
            return NSLocalizedString("Future", comment: "Future style name")
        case .batchScreen:
            return NSLocalizedString("All", comment: "All style name")
        }
    }

    func shouldInclude(date: Date) -> Bool {
        let isInToday = Locale.current.calendar.isDateInToday(date)
        switch self {
        case .cocktailSpecs:
            return isInToday
        case .savedBatches:
            return (date > Date.now) && !isInToday
        case .batchScreen:
            return true
        }
    }
}
