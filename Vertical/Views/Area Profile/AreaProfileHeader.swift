//
//  AreaProfileHeader.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/27/22.
//

import SwiftUI
import Foundation
import SDWebImageSwiftUI

struct AreaProfileHeader: View {
    
    let area: Area
<<<<<<< HEAD
    @EnvironmentObject var areaSearchViewModel: AreaSearchViewModel

    var body: some View {
        VStack {
            HStack(spacing: 40) {
                HStack {
                    WebImage(url: areaSearchViewModel.areaImages[area.image] == nil ? nil : areaSearchViewModel.areaImages[area.image]!)
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .shadow(radius: 7)
                    VStack {
                        Text(area.name)
                            .font(.system(size: 26, weight: .heavy))
                            .frame(width: .infinity, alignment: .leading)
                        Text(area.location)
                            .font(.system(size: 14, weight: .medium))
                    }
=======
    @State private var isFollowing: Bool = false
    @State private var unfollowConfirm: Bool = false

    var body: some View {
        VStack {
            Image(area.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 100)
                .shadow(color: .black, radius: 2, x: 0, y: 0)
                .clipped()
            HStack(spacing: 70) {
                VStack(alignment: .leading) {
                    Text(area.name)
                        .font(.system(size: 24, weight: .heavy))
                        .multilineTextAlignment(.leading)
                    Text(area.location)
                        .font(.system(size: 14, weight: .medium))
>>>>>>> main
                }
                HStack {
                    VStack {
                        Text(String(area.follower_count))
                            .font(.system(size: 18, weight: .heavy))
                        Text("Followers")
                            .font(.system(size: 14, weight: .regular))
                    }
                    VStack {
                        Text(String(area.boulder_count))
                            .font(.system(size: 18, weight: .heavy))
                        Text("Boulders")
                            .font(.system(size: 14, weight: .regular))
                    }
                }
            }
            HStack(spacing: 0) {
                HStack(alignment: .center) {
                    Button(action:{
                        if (isFollowing) {
                            unfollowConfirm = true
                        }
                        if (!isFollowing) {
                            isFollowing = true
                        }
                    }, label: {
                        if (isFollowing) {
                            Text("Following")
                                .padding([.leading, .trailing], 20)
                                .padding([.bottom, .top], 10)
                                .background(.white)
                                .foregroundColor(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                                .cornerRadius(20)
                                .overlay(
                                    Capsule(style: .continuous)
                                        .stroke(.purple, lineWidth: 2)
                                )
                        }
                        else {
                            Text("Follow")
                                .padding([.leading, .trailing], 20)
                                .padding([.bottom, .top], 10)
                                .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    })
                    .confirmationDialog(
                        "Unfollow this area?",
                        isPresented: $unfollowConfirm,
                        titleVisibility: .visible
                    ) {
                        Button("Yes", role: .destructive, action: {
                            isFollowing = false
                        })
                    }
                    NavigationLink(destination: VideoPostForm(tabIndex: .constant(0))) {
                        Text("+")
                            .padding([.leading, .trailing], 15)
                            .padding([.bottom, .top], 10)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    Text("•••")
                }
                .frame(width: 260, alignment: .leading)
                StarsView(rating: area.rank)
                    .frame(width: 100)
            }
        }
    }
        
}

struct AreaProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfileHeader(area: Area(name: "test", location: "test", image: "test", zip: "test", follower_count: 100, boulder_count: 100, rank: 4, elevation: 100, bio: "test", description: "test"))
    }
}
