//
//  UserProfile.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import SwiftUI

struct UserProfile: View {
    
<<<<<<< HEAD
    var user: UserInfo
=======
    var user: User
>>>>>>> main
    
    var body: some View {
        VStack(spacing: 0){
                UserProfileHeader(user: user)
                UserProfileBottom()
        }
    }
}

<<<<<<< HEAD
struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(user: UserInfo(id: "testID", email: "test", username: "test", fullname: "test", profileImageUrl: "test", location: "test", description: "test", followers: 5, following: 5, ascents: 5))
    }
}
=======
//struct UserProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfile(user: user)
//    }
//}
>>>>>>> main
