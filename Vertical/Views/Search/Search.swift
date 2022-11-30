//
//  Search.swift
//  Vertical
//
//  Created by Ethan West on 10/31/22.
//

import SwiftUI

struct Search: View {
    @State private var tabSelected: SearchTab = .users
    @State var searchText = ""
    
    @ObservedObject var climbSearch = ClimbSearchViewModel()
<<<<<<< HEAD
    @ObservedObject var userSearch = UserSearchViewModel()
    @ObservedObject var areaSearch = AreaSearchViewModel()
=======
    @ObservedObject var viewModel = SearchViewModel()
>>>>>>> main
    
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    SearchBar(text: $searchText, tabSelected: $tabSelected)
                    
                    SearchTabBar(selectedTab: $tabSelected)
                    Divider()
                    TabView(selection: $tabSelected) {
                        ForEach(SearchTab.allCases, id: \.rawValue) { tab in
                            HStack{
                                if(tab.rawValue == "users"){
<<<<<<< HEAD
                                    UserSearch(users: userSearch.users)
=======
                                    UserSearch(searchText: searchText, viewModel: viewModel)
>>>>>>> main
                                }
                                if(tab.rawValue == "climbs"){
                                    ClimbSearch(climbs: climbSearch.climbs)
                                }
                                if(tab.rawValue == "areas"){
                                    AreaSearch(areas: areaSearch.areas)
                                }
                            }.padding([.leading, .trailing], 10)
                                .tag(tab)
                        }
                    }
                }.padding([.top], 10)
            }
        }
        .environmentObject(climbSearch)
        .environmentObject(userSearch)
        .environmentObject(areaSearch)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
