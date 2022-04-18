//
//  GameViewModel.swift
//  Thoughts
//
//  Created by Vas Kaloidis on 4/17/22.
//

import Foundation


class GameViewModel: ObservableObject {
    
    var sessionType: SessionType
    
    
    init(sessionType: SessionType = .normal) {
        self.sessionType = sessionType
    }
    
    @Published private(set) var state = State() {
      willSet {
        self.objectWillChange.send()
      }
    }
    
    struct State {
        var thoughts: [Thought] = []
    }
    
    func add(content: String) {
        self.state.thoughts.append(Thought(content: content))
    }
    
    
}


extension GameViewModel {
    static func mock() -> GameViewModel {
        let vm = GameViewModel()
        vm.add(content: "Random thought 1")
        vm.add(content: "Random thought 2")
        vm.add(content: "Random thought 3")
        return vm
    }
}
