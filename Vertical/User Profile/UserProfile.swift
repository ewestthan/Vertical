//
//  UserProfile.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        VStack{
            UserProfileHeader()
            UserProfileBottom()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
