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
    @ObservedObject var postViewModel: UserPostViewModel
    
    init(user: User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        self.postViewModel = UserPostViewModel()
        postViewModel.grabPosts(userId: user.id!)
    }
    
    var body: some View {
            VStack(spacing: 0){
                UserProfileHeader(viewModel: viewModel)
                UserProfileBottom(userPosts: postViewModel.userPosts, userId: user.id!)
            }.environmentObject(postViewModel)
    }
}


struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(user: User(id: "GJjETbNXUEM4Q756EcFXAJYT53n2", email: "test", username: "test", fullname: "test", profileImageUrl: "test", location: "test", description: "test", followers: 5, following: 5, ascents: 5))
    }
}
