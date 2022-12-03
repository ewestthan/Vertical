//
//  UserProfileHeader.swift
//  Vertical
//
//  Created by Ethan West on 10/18/22.
//
import SwiftUI
import Foundation

struct UserProfileHeader: View {

    @ObservedObject var viewModel: ProfileViewModel

    
    var body: some View {
        ZStack{
            VStack{

                ProfileActionButtonView(viewModel: viewModel)
                HStack(spacing: 60){
                    VStack{
                        Text(String(viewModel.user.followers)).font(.system(size: 24)).fontWeight(.bold)
                        Text("Followers").font(.system(size: 14))
                    }
                    VStack{
                        Text(String(viewModel.user.ascents)).font(.system(size: 24)).fontWeight(.bold)
                        Text("Ascents").font(.system(size: 14))
                    }
                    VStack{
                        Text(String(viewModel.user.following)).font(.system(size: 24)).fontWeight(.bold)
                        Text("Following").font(.system(size: 14))
                    }
                }
                
                VStack{
                    Text(viewModel.user.description)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.gray)
                        .padding([.bottom, .top], 3)
                }
            }.padding(.top, 15)
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity)
                .background(Color(.gray).opacity(0.2))
                .padding(.top, 160)
            VStack{
                HStack(spacing: 0){
                    Text("")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(viewModel.user.fullname).font(.system(size: 32))
                        .foregroundColor(.black)
                        .fontWeight(.bold).offset(y: 5)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Menu {
                        logoutButton
                        NavigationLink( destination: EditUserProfile(), label: {
                            Text("Edit Profile")
                        })
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                            .frame(width: 25, height: 25)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(100)
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 15)
                }
                Text("@" + viewModel.user.username).font(.system(size: 14)).foregroundColor(.gray)
                    .foregroundColor(.black).offset(y: 5)
                UserProfilePic(pic: viewModel.user.profileImageUrl)
            }.offset(y: -85)
                .frame(maxHeight: 100)
            
        }
    }
    
    var logoutButton: some View {
        Button { Task{
            try await AuthViewModel.shared.signout()
        }} label: {
            Text("Logout").foregroundColor(.black)
        }
    }

}

//struct UserProfileHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileHeader(user: User(id: "testID", email: "test", username: "test", fullname: "test", profileImageUrl: "test", location: "test", description: "test", followers: 5, following: 5, ascents: 5))
//    }
//}
