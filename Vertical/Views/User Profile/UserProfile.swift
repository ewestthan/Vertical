//
//  UserProfile.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import SwiftUI

struct UserProfile: View {
    
    var user: UserRow
    
    var body: some View {
        VStack{
            UserProfileHeader(user: user)
            UserProfileBottom().offset(y:-8)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(user: users[0])
    }
}
