//
//  ContentView.swift
//  Vertical
//
//  Created by Ethan West on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView(){
                Feed()
                    .tabItem(){Image(systemName: "house")}
                Search()
                    .tabItem(){Image(systemName: "magnifyingglass")}
                UserProfile(user: users[0])
                    .tabItem(){Image(systemName: "person")}
            }.frame(alignment: .bottomLeading)
                .accentColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
