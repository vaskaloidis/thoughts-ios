//
//  ContentView.swift
//  Thoughts
//
//  Created by Vas Kaloidis on 4/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheet: Bool = false
    @StateObject var appState = AppStateManager.shared
    
    var body: some View {
        NavigationView {
            #if os(iOS) || os(watchOS) || os(tvOS)
            list.navigationBarTitle("SwiftUI")
            Text("Select a group")
            #elseif os(OSX)
            list.listStyle(SidebarListStyle())
            Text("Select a group").frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
        }
        .accentColor(.accentColor)
    }
        
    
    
    var list: some View {
        List {
            Grouping(title: "New Game", icon: "capsule", content: { NewGame() })
        }
    }
    
    struct Grouping<Content: View>: View {
        var title: String
        var icon: String
        var content: () -> Content
        
        var body: some View {
            NavigationLink(destination: GroupView(title: title, content: content)) {
                #if os(iOS)
                Label(title, systemImage: icon).font(.headline).padding(.vertical, 8)
                #else
                Label(title, systemImage: icon)
                #endif
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
