//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/25/22.
//

import SwiftUI

struct AreaProfile: View {
    var body: some View {
        VStack{
            AreaProfileHeader(area: areas[0])
        }
    }
}

struct AreaProfile_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfile()
    }
}
