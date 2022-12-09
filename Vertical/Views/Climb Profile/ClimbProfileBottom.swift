//
//  ClimbProfileBottom.swift
//  Vertical
//
//  Created by Ethan West on 11/10/22.
//

import SwiftUI

struct ClimbProfileBottom: View {
    
    @State private var tabSelected: ClimbProfileTab = .ascents
    var climbPosts: [Post]

    var body: some View {
        ZStack {
            VStack {
                ClimbProfileTabBar(selectedTab: $tabSelected)
                Divider()
                TabView(selection: $tabSelected) {
                    ForEach(ClimbProfileTab.allCases, id: \.rawValue) { tab in
                        HStack {
                            if(tab.rawValue == "ascents"){
                                ClimbProfileAscentList(climbPosts: climbPosts)
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
        ClimbProfileBottom(climbPosts: [Post(date: Date(timeIntervalSince1970: TimeInterval(10)), description: "Test", climbName: "test", climbLocation: "test", grade: 5, imageUrl: "No Image", ownerId: "Test", ownerImageUrl: "no Image", ownerUsername: "test", rating: 3, likes: 2)])
    }
}
