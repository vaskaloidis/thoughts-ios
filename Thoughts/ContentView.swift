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
            list.navigationBarTitle("Thoughts")
            Text("Select a group")
            #elseif os(OSX)
            list.listStyle(SidebarListStyle())
            Text("Select a group").frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
        }
        .accentColor(.accentColor)
    }
        
    
    
    var list: some View {
        VStack{
            Grouping(title: "New Game", icon: "plus", content: { NewGame() })
            List(AppStateManager.shared.sessions) { session in
                ZStack {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.white)
                        .shadow(radius: 10)
                    HStack {
                        Image(systemName: "bolt")
                            .font(.system(size: 100))
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 10, x: 0, y: 10)
                        VStack {
                            if let title = session.title {
                                Label(title, systemImage: "paperplane")
                                    .font(.title)
                                    .labelStyle(.titleAndIcon)
                            }
                            Text(session.createdAtPretty())
                                .font(.callout)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .lineLimit(3)
                            
                            Text("\(session.thoughts.count)")
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(5)
                                .background(Color.green)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                    }
                }.padding(20)
                 .multilineTextAlignment(.center)
            }
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
