//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/25/22.
//

import SwiftUI

struct AreaProfile: View {
    var data: Area
    

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    AreaProfileHeader(area: data)
                    AreaProfileContent(area: data)
                }
            }
        }
    }
    
}

struct AreaProfile_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfile(data: Area(name: "test", location: "test", image: "test", zip: "test", follower_count: 100, boulder_count: 100, rank: 4, elevation: 100, bio: "test", description: "test"))
    }
}
