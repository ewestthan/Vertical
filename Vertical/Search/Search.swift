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
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                SearchBar(text: $searchText)
                
                SearchTabBar(selectedTab: $tabSelected)
                
                TabView(selection: $tabSelected) {
                    ForEach(SearchTab.allCases, id: \.rawValue) { tab in
                        HStack{
                            if(tab.rawValue == "users"){
                                UserSearch(searchText: searchText)
                            }
                            if(tab.rawValue == "climbs"){
                                ClimbSearch(searchText: searchText).background(.gray)
                            }
                            if(tab.rawValue == "areas"){
                                Text("\(tab.rawValue.capitalized)")
                                    .bold()
                                    .animation(nil, value: tabSelected)
                            }
                        }
                        .tag(tab)
                    }
                }
            }.padding([.top], 10)
        }.background(.gray)
        
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
