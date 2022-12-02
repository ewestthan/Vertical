//
//  UserSearch.swift
//  Vertical
//
//  Created by Ethan West on 10/31/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchUserRow: View {
    var user: UserInfo
    @EnvironmentObject var userSearchViewModel: UserSearchViewModel
    
    var body: some View {
        HStack{
            content
        }.contentShape(Rectangle())
            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956, opacity: 0.8))
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding([.leading, .trailing], 10)
    }
    
    private var content: some View{
        VStack{
            HStack{
                WebImage(url: userSearchViewModel.userImages[user.profileImageUrl] == nil ? nil : userSearchViewModel.userImages[user.profileImageUrl]!)                            .resizable()
                            .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())

                VStack(alignment: .leading){
                    Text(user.username).font(.system(size: 16))
                    Text(user.location).font(.system(size: 12))

                }.padding(.leading, 10)
                Spacer()
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
        }
    }
}

struct UserSearch: View {
    
    let users: [UserInfo]

    var body: some View{
        scrollForEach
    }
                       
    var scrollForEach: some View {
        ScrollView{
            LazyVStack{
                ForEach(users, id: \.id){ user in
                    NavigationLink(destination: UserProfile(user: user))
                    { SearchUserRow(user: user).animation(.linear(duration: 0.3))
                            .frame(maxHeight: 60)
                    }
                }
            }
        }
    }
}

struct UserSearch_Previews: PreviewProvider {
    static var previews: some View {
        UserSearch(users: [UserInfo(id: "testID", email: "test", username: "test", fullname: "test", profileImageUrl: "test", location: "test", description: "test", followers: 5, following: 5, ascents: 5)])
    }
}
