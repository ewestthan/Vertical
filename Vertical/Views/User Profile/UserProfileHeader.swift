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
                        .offset(y: 20)
                    Button(action:{
                        
                    }, label: {
                        Text("Message")
                            .frame(maxWidth: 120, maxHeight: 35)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .fontWeight(.bold)
                    })
                }.padding(.bottom, 10)
                
                HStack(spacing: 40){
                    VStack{
                        Text("Followers")
                        Text(String(user.followers))
                    }
                    VStack{
                        Text("Ascents")
                        Text(String(user.ascents))
                    }
                    VStack{
                        Text("Following")
                        Text(String(user.following))
                    }
                }.fontWeight(.bold)
                
                VStack{
                    Text(user.description)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.gray)
                        .padding([.bottom, .top], 3)
                }
            }.padding(.top, 20)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity)
                .background(Color(.gray).opacity(0.2))
            .padding(.top, 160)
            VStack{
                Text(user.name).font(.title)
                    .foregroundColor(.black)
                Text("@" + user.handle).font(.subheadline)
                    .foregroundColor(.black)
                UserProfilePic(pic: user.image)
            }.offset(y: -70)
                .frame(maxHeight: 100)
                .fontWeight(.bold)
        }
    }
}

struct UserProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeader(user: users[0])
    }
}
