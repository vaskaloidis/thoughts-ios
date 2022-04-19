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
            
            VStack {
                List(self.viewModel.state.thoughts) { thought in
                    ZStack {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.white)
                            .shadow(radius: 10)
                        VStack {
                            Text(thought.content).font(.largeTitle)
                                .foregroundColor(.black)
                            if thought.afterthought != nil {
                                Text(thought.afterthought!).font(.title)
                                    .foregroundColor(.gray)
                            }
                        }
                    }.padding(20)
                     .multilineTextAlignment(.center)
                }
                
                Spacer()
                TextField("Placeholder", text: $text)
                Button(action: { self.viewModel.add(content: text)}) {
                    Text("Submit")
                }
            }
    }
}
