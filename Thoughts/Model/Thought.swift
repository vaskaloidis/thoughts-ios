//
//  Thought.swift
//  Thoughts
//
//  Created by Vas Kaloidis on 4/17/22.
//

import Foundation


class Thought: Identifiable {
    var id = UUID()
    var content: String
    var creatdAt: Date = Date()
    var versions: [String] = []
    
    
    init(content: String) {
        self.content = content
        self.versions.append(content)
    }
    
    func addNew(text: String) {
        self.content = text
        self.versions.append(content)
    }
    
}
