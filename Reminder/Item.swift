//
//  Item.swift
//  Reminder
//
//  Created by Mingoo Kim on 4/18/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
