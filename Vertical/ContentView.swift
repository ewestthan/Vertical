//
//  ContentView.swift
//  Vertical
//
//  Created by Ethan West on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(){
            Feed()
                .tabItem(){Label("Home", systemImage: "house")}
            Search()
                .tabItem(){Label("Search", systemImage: "magnigyingglass")}
            UserProfile(user: users[0])
                .tabItem(){Label("Profile", systemImage: "person")}
        }.frame(alignment: .bottomLeading)
            .accentColor(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
