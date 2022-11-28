//
//  UserProfileHeader.swift
//  Vertical
//
//  Created by Ethan West on 10/18/22.
//
import SwiftUI
import Foundation

struct UserProfileHeader: View {
    
    let user: UserRow
    
    var body: some View {
        ZStack{
            VStack{
                HStack(spacing: 25){
                    Button(action:{
                    }, label: {
                        Text("Follow")
                            .frame(maxWidth: 120, maxHeight: 35)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .fontWeight(.bold)
                    })
                    Text(user.location)
                        .foregroundColor(.gray)
                        .offset(y: 15)
                        .font(.system(size: 14))
                    Button(action:{
                        
                    }, label: {
                        Text("Message")
                            .frame(maxWidth: 120, maxHeight: 35)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .fontWeight(.bold)
                    })
                }
                
                HStack(spacing: 60){
                    VStack{
                        Text(String(user.followers)).font(.system(size: 24)).fontWeight(.bold)
                        Text("Followers").font(.system(size: 14))
                    }
                    VStack{
                        Text(String(user.ascents)).font(.system(size: 24)).fontWeight(.bold)
                        Text("Ascents").font(.system(size: 14))
                    }
                    VStack{
                        Text(String(user.following)).font(.system(size: 24)).fontWeight(.bold)
                        Text("Following").font(.system(size: 14))
                    }
                }
                
                VStack{
                    Text(user.description)
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
                HStack{
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
                    }

                    
                }.frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 20)
                Text(user.name).font(.system(size: 32))
                    .foregroundColor(.black).fontWeight(.bold).offset(y: 5)
                Text("@" + user.handle).font(.system(size: 14)).foregroundColor(.gray)
                    .foregroundColor(.black).offset(y: 5)
//                UserProfilePic(pic: user.profileImageUrl)
            }.offset(y: -75)
                .frame(maxHeight: 100)
            
        }
    }
    var logoutButton: some View{
        Button { Task{
            try await AuthViewModel.shared.signout()
        }} label: {
            Text("Logout").foregroundColor(.black)
        }

    }
}

struct UserProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeader(user: users[0])
    }
}
