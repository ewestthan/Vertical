//
//  UserSearch.swift
//  Vertical
//
//  Created by Ethan West on 10/31/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchUserRow: View {
<<<<<<< HEAD
    var user: UserInfo
    @EnvironmentObject var userSearchViewModel: UserSearchViewModel
=======
    var user: User
>>>>>>> main
    
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
<<<<<<< HEAD
                WebImage(url: userSearchViewModel.userImages[user.profileImageUrl] == nil ? nil : userSearchViewModel.userImages[user.profileImageUrl]!)                            .resizable()
                            .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())

                VStack(alignment: .leading){
                    Text(user.username).font(.system(size: 16))
                    Text(user.location).font(.system(size: 12))
=======
//                Image(user.image)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 35, height: 35)
//                    .clipShape(Circle())

                VStack(alignment: .leading){
                    Text(user.username).font(.system(size: 16))
//                    Text(user.location).font(.system(size: 12))
>>>>>>> main
                }.padding(.leading, 10)
                Spacer()
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
        }
    }
}

struct UserSearch: View {
    
<<<<<<< HEAD
    let users: [UserInfo]
    
=======
    let searchText: String
    @State var searchCollection = users
    @ObservedObject var viewModel: SearchViewModel

>>>>>>> main
    var body: some View{
        scrollForEach
    }
                       
    var scrollForEach: some View {
        ScrollView{
            LazyVStack{
<<<<<<< HEAD
                ForEach(users, id: \.id){ user in
                    NavigationLink(destination: UserProfile(user: user))
                    { SearchUserRow(user: user).animation(.linear(duration: 0.3))
=======
                ForEach(viewModel.users.filter({ searchText.isEmpty ? true : $0.username.contains(searchText)}), id: \.id){ user in
                    NavigationLink(
                        destination: Text("")){
                        SearchUserRow(user: user).animation(.linear(duration: 0.3))
>>>>>>> main
                            .frame(maxHeight: 60)
                    }
                }
            }
        }
    }
}

struct UserSearch_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< HEAD
        UserSearch(users: [UserInfo(id: "testID", email: "test", username: "test", fullname: "test", profileImageUrl: "test", location: "test", description: "test", followers: 5, following: 5, ascents: 5)])
=======
        UserSearch(searchText: "", viewModel: SearchViewModel())
>>>>>>> main
    }
}
