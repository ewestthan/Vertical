//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/25/22.
//

import SwiftUI

struct AreaProfile: View {
    
    @ObservedObject private var areaVM: AreaViewModel
    var area: Area
    var id: String
    var loadFromId: Bool
    
    
    init(id: String) {
        self.id = id
        self.loadFromId = true
        self.area = Area()
        self.areaVM = AreaViewModel(area: Area())
    }
    
    init(area: Area) {
        if let id = area.id {
            self.id = id
        }
        else {
            self.id = "-1"
        }
        self.loadFromId = false
        self.area = area
        self.areaVM = AreaViewModel(area: Area())
    }

    var body: some View {
        ZStack {
            VStack {
                AreaProfileHeader(area: areaVM.area)
                AreaProfileContent(area: areaVM.area)
            }
            .onAppear{ Task {
                if (self.loadFromId) {
                    await areaVM.loadArea(id: self.id)
                }
                else {
                    await areaVM.setArea(area: self.area)
                }
            }}
        }
        .edgesIgnoringSafeArea(.top)
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
