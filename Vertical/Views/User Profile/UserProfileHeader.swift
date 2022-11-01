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
        VStack{
            VStack{

                Text(user.name).font(.title)
                    .foregroundColor(.black)
                Text(user.handle).font(.subheadline)
                    .foregroundColor(.black)
                UserProfilePic(pic: user.image)
                HStack(spacing: 30){
                    Button(action:{
                    }, label: {
                        Text("Follow")
                            .padding([.leading, .trailing], 30)
                            .padding([.bottom, .top], 10)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    })
                    Text(user.location)
                        .foregroundColor(.gray)
                        .offset(y: 20)
                    Button(action:{
                        
                    }, label: {
                        Text("Message")
                            .padding([.leading, .trailing], 20)
                            .padding([.bottom, .top], 10)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    })
                }.offset(y: -30)
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
                    .offset(y: -20)
                VStack{
                    Text(user.description)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.gray)
                        .padding([.bottom, .top], 5)
                }.offset(y:-20)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 330, alignment: .topLeading)
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.767, opacity: 0.588))
    }
}

struct UserProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeader(user: users[0])
    }
}
