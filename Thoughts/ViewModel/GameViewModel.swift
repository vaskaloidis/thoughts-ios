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
        self.state.game = Game()
    }
    
    @Published private(set) var state = State() {
      willSet {
        self.objectWillChange.send()
          AppStateManager.shared.currentGame = self.state.game
      }
    }
    
    struct State {
        var thoughts: [Thought] = []
        var game: Game?
    }
    
    func add(content: String) {
        self.state.thoughts.append(Thought(content: content))
        self.state.game?.thoughts.append(Thought(content: content))
    }
    
    func complete() {
        if let game = self.state.game {
            AppStateManager.shared.sessions.append(game)
        }
        AppStateManager.shared.currentGame = nil
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
