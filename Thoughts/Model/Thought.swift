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
    var afterthought: String?
    var afterthoughts: [String] = []
    
    
    init(content: String) {
        self.content = content
        self.afterthoughts.append(content)
    }
    
    func addAfterthought(text: String) {
        self.afterthoughts.append(content)
        self.afterthought = text
    }
    
}
