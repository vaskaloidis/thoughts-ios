//
//  NewGame.swift
//  Thoughts
//
//  Created by Vas Kaloidis on 4/17/22.
//

import Foundation
import SwiftUI


struct NewGame: View {
    @StateObject var vm = GameViewModel()
    
    var body: some View {
        SectionView(
            title: "Basic Game",
            description: "A simple untimed game to caption your thoughts.",
            content: {
                NavigationLink(destination: GameView()) {
                    Text("Start")
                }
            }
        )
    }
    
}
