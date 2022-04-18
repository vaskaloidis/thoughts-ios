//
//  GroupView.swift
//  Thoughts
//
//  Created by Vas Kaloidis on 4/17/22.
//

import SwiftUI

struct GroupView<Content: View>: View {
    var title: String
    let content: () -> Content
    
    var body: some View {
        #if os(iOS)
        return List {
            content()
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle(title, displayMode: .inline)
        #else
        return ScrollView {
            content().padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(title: "Group", content: { Text("Content") })
            .previewLayout(.sizeThatFits)
    }
}
