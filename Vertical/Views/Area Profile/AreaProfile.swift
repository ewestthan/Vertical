//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/25/22.
//

import SwiftUI

struct AreaProfile: View {
    
    let id: String
    var data: Area
    
    init(id: String) {
        self.id = id
        self.data = Area()
    }
    
    var body: some View {
        VStack{
            AreaProfileHeader(area: self.data)
            AreaProfileContent(area: self.data)
        }
    }
    
}

struct AreaProfile_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfile(id: "nyeaiKZxDTg81GS1GYWV")
    }
}
