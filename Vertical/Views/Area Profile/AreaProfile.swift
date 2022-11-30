//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/25/22.
//

import SwiftUI

struct AreaProfile: View {
    
<<<<<<< HEAD
    var data: Area
    
=======
    var id: String
    @StateObject private var areaVM = AreaViewModel()
    
    init(id: String) {
        self.id = id
    }
    
>>>>>>> main
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    AreaProfileHeader(area: areaVM.area)
                    AreaProfileContent(area: areaVM.area)
                }
                .onAppear{ Task {
                    await areaVM.loadArea(id: self.id)
                }}
            }
        }
    }
    
}

struct AreaProfile_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< HEAD
        AreaProfile(data: Area(name: "test", location: "test", image: "test", zip: "test", follower_count: 100, boulder_count: 100, rank: 4, elevation: 100, bio: "test", description: "test"))
=======
        AreaProfile(id: "Ngyru3cnP0fjmnOzL5CY")
>>>>>>> main
    }
}
