//
//  Item.swift
//  abc
//
//  Created by Ayush Ranjan on 16/10/24.
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
