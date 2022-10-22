//
//  UserProfileHeader.swift
//  Vertical
//
//  Created by Ethan West on 10/18/22.
//
import SwiftUI
import Foundation

struct UserProfileHeader: View {

    var body: some View {
        VStack{
            VStack{

                Text("Jimmy").font(.title)
                    .foregroundColor(.black)
                Text("@jwebxl").font(.subheadline)
                    .foregroundColor(.black)
                UserProfilePic()
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
                    Text("Tahoe, CA")
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
                        Text("100")
                    }
                    VStack{
                        Text("Ascents")
                        Text("100")
                    }
                    VStack{
                        Text("Following")
                        Text("100")
                    }
                }.fontWeight(.bold)
                    .offset(y: -20)
                VStack{
                    Text("boulders are cool, blah blah blah. climbing words and stuff go here. tell me about yourself.")
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.gray)
                        .padding([.bottom, .top], 5)
                }.offset(y:-20)
            }
        }
        .frame(width: 392.0)
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.767, opacity: 0.588))
    }
}
