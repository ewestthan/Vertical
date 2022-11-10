//
//  ClimbProfileView.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import SwiftUI

struct ClimbProfile: View {
    var body: some View {
        VStack{
            ClimbProfileHeader()
            ClimbProfileBottom()
        }
    }
}

struct ClimbProfile_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfile()
    }
}
