//
//  UserProfile.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import SwiftUI

struct UserProfile: View {
    
//    var user: UserInfo
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                UserProfileHeader(viewModel: viewModel)
                UserProfileBottom()
            }
        }
    }
}


struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(user: User(id: "testID", email: "test", username: "test", fullname: "test", profileImageUrl: "test", location: "test", description: "test", followers: 5, following: 5, ascents: 5))
    }
}

