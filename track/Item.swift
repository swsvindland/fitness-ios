//
//  Item.swift
//  track
//
//  Created by Sam Svindland on 1/26/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var systolic: Int
    var diastolic: Int
    
    init(timestamp: Date, systolic: Int, diastolic: Int) {
        self.timestamp = timestamp
        self.systolic = systolic
        self.diastolic = diastolic
    }
}
