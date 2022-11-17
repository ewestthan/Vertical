//
//  UserProfile.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import SwiftUI

struct UserProfile: View {
    
    var user: User
    
    var body: some View {
        VStack(spacing: 0){
                UserProfileHeader(user: user)
                UserProfileBottom()
        }
    }
}

//struct UserProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfile(user: user)
//    }
//}
