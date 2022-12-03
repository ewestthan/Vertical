//
//  ContentView.swift
//  Vertical
//
//  Created by Ethan West on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
            }
            else {
                if let user = viewModel.currentUser{
                    NavigationView{
                        TabView(selection: $selectedIndex){
                            Feed()
                                .onTapGesture {
                                    selectedIndex = 0
                                }
                                .tabItem(){Image(systemName: "house")}
                                .tag(0)
                            Search()
                                .onTapGesture {
                                    selectedIndex = 1
                                }
                                .tabItem(){Image(systemName: "magnifyingglass")}
                                .tag(1)
                            UserProfile(user: user)
                                .onTapGesture {
                                    selectedIndex = 2
                                }
                                .tabItem(){Image(systemName: "person")}
                                .tag(2)
                            VideoPostForm(tabIndex: $selectedIndex)
                                .onTapGesture {
                                    selectedIndex = 3
                                }
                                .tabItem(){Image(systemName: "person")}
                                .tag(3)
                        }.frame(alignment: .bottomLeading)
                            .accentColor(.gray)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel())
    }
}
