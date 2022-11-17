//
//  ClimbProfileView.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import SwiftUI

struct ClimbProfile: View {
    var climb: ClimbProfileModel
    
    var body: some View {
        VStack{
            ClimbProfileHeader(climb: climb)
            ClimbProfileBottom()
        }
    }
}

struct ClimbProfile_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfile(climb: ClimbProfileModel(Name: "test", Grade: "V4", Rating: 4, Area: "Test", Picture_URL: "Test"))
    }
}
