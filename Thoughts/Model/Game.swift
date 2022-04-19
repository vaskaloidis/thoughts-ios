//
//  Game.swift
//  Thoughts
//
//  Created by Vas Kaloidis on 4/17/22.
//

import Foundation
import SwiftUI

class Game: ObservableObject, Identifiable {
    let id = UUID()
    let createdAt = Date()
    var completedAt: Date?
    @Published var title: String?
    
    @Published var thoughts: [Thought] = []
    
    func createdAtPretty() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        return dateFormatter.string(from: createdAt)
    }
    
    func complete() {
        self.completedAt = Date()
    }
}
