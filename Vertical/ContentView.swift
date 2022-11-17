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
                UserProfile(user: UserInfo(id: "testID", email: "test", username: "test", fullname: "test", profileImageUrl: "test", location: "test", description: "test", followers: 5, following: 5, ascents: 5))
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
