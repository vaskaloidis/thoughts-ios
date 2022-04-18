//
//  GameView.swift
//  Thoughts
//
//  Created by Vas Kaloidis on 4/17/22.
//

import Foundation
import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    init(sessionType: SessionType = .normal) {
        self.viewModel = GameViewModel(sessionType: sessionType)
        self.viewModel = GameViewModel.mock()
    }
    
    @State private var text = ""
    
    var body: some View {
        Group {
            SectionView(
                title: "Create Thought",
                description: nil,
                content: {
                    VStack {
                        List(self.viewModel.state.thoughts) { thought in
                            Text(thought.content)
            //                Grouping(title: "Buttons", icon: "capsule", content: { Text(thought.content) })
                        }
                        Spacer()
                        TextField("Placeholder", text: $text)
                        Button(action: { self.viewModel.add(content: text)}) {
                            Text("Submit")
                        }
                    }
                }
            )

        }
    }
}
