//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/25/22.
//

import SwiftUI

struct AreaProfile: View {
    
    @StateObject private var areaVM = AreaViewModel(area: Area())
    var area: Area
    var id: String
    var loadFromId: Bool
    
    
    init(id: String) {
        self.id = id
        self.loadFromId = true
        self.area = Area()
    }
    
    init(area: Area) {
        self.id = "-1"
        self.loadFromId = false
        self.area = area
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    let areaLoad = self.loadFromId ? areaVM.area : self.area
                    AreaProfileHeader(area: areaLoad)
                    AreaProfileContent(area: areaLoad)
                }
                .onAppear{ Task {
                    if (self.loadFromId) {
                        await areaVM.loadArea(id: self.id)
                    }
                }}
            }
            .edgesIgnoringSafeArea(.top)
        }
        .environmentObject(AreaSearchViewModel())
    }
    
}

struct AreaProfile_Previews: PreviewProvider {
    static var previews: some View {
        //AreaProfile(area: Area())
        //AreaProfile(id: "Ngyru3cnP0fjmnOzL5CY")
        AreaProfile(id: "YacnDtXEvP8FdA8nG8K9")
        //AreaProfile(id: "RnUrssPzHHBxDKfRYJTt")
    }
}
