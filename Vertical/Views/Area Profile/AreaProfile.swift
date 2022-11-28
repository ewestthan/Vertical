//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/25/22.
//

import SwiftUI

struct AreaProfile: View {
    
    var id: String
    @StateObject private var areaVM = AreaViewModel()
    
    init(id: String) {
        self.id = id
    }
    
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
        AreaProfile(id: "Ngyru3cnP0fjmnOzL5CY")
    }
}
