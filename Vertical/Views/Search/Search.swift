//
//  Search.swift
//  Vertical
//
//  Created by Ethan West on 10/31/22.
//

import SwiftUI

struct Search: View {
    @State private var tabSelected: SearchTab = .users
    @ObservedObject var climbSearch = ClimbSearchViewModel()
    
    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    SearchBar(text: $searchText)
                    
                    SearchTabBar(selectedTab: $tabSelected)
                    Divider()
                    TabView(selection: $tabSelected) {
                        ForEach(SearchTab.allCases, id: \.rawValue) { tab in
                            HStack{
                                if(tab.rawValue == "users"){
                                    UserSearch(searchText: searchText)
                                }
                                if(tab.rawValue == "climbs"){
                                    ClimbSearch(climbs: climbSearch.climbs)
                                }
                                if(tab.rawValue == "areas"){
                                    AreaSearch(searchText: searchText)
                                }
                            }.padding([.leading, .trailing], 10)
                                .tag(tab)
                        }
                    }
                }.padding([.top], 10)
            }
        }
        .environmentObject(climbSearch)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
