//
//  ClimbProfileBottom.swift
//  Vertical
//
//  Created by Ethan West on 11/10/22.
//

import SwiftUI

struct ClimbProfileBottom: View {
    
    @State private var tabSelected: ClimbProfileTab = .ascents

    var body: some View {
        ZStack {
                VStack {
                    ClimbProfileTabBar(selectedTab: $tabSelected)
                    Divider()
                    TabView(selection: $tabSelected) {
                        ForEach(ClimbProfileTab.allCases, id: \.rawValue) { tab in
                            HStack {
                                if(tab.rawValue == "climbs"){
                                    UserProfileClimbList()
                                }
                                if(tab.rawValue == "filter"){
                                    UserProfileFilter()
                                }
                            }
                            .tag(tab)
                        }
                        .background(Color(.gray).opacity(0.2))
                    }
                }
            }.padding([.top], 10)
                .background(Color(.gray).opacity(0.2))
    }
}

struct ClimbProfileBottom_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfileBottom()
    }
}
