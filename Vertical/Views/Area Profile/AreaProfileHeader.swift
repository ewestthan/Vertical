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
    
    @EnvironmentObject var areaSearchViewModel: AreaSearchViewModel
    @State private var isFollowing: Bool = false
    @State private var unfollowConfirm: Bool = false
    
    let area: Area
    var name: String
    var location: String
    var image: String
    var follower_count: Int
    var boulder_count: Int
    var rank: Int
    
    init(area: Area) {
        
        self.area = area
        
        if let name = area.name {
            self.name = name
        }
        else {
            self.name = "None"
        }
        
        if let location = area.location {
            self.location = location
        }
        else {
            self.location = "None"
        }
        
        if let image = area.image {
            self.image = image
        }
        else {
            self.image = "smuggs"
        }
        
        if let follower_count = area.follower_count {
            self.follower_count = follower_count
        }
        else {
            self.follower_count = -1
        }
        
        if let boulder_count = area.boulder_count {
            self.boulder_count = boulder_count
        }
        else {
            self.boulder_count = -1
        }
        
        if let rank = area.rank {
            self.rank = rank
        }
        else {
            self.rank = 5
        }
        
    }
    
    
    var body: some View {
        VStack {
            //WebImage(url: areaSearchViewModel.areaImages[self.image] == nil ? nil : areaSearchViewModel.areaImages[self.image]!)
            Image("smuggs")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 200)
                .shadow(color: .black, radius: 2, x: 0, y: 0)
                .clipped()
            HStack(spacing: 70) {
                VStack(alignment: .leading) {
                    
                    Text(self.name)
                        .font(.system(size: 20, weight: .heavy))
                        .multilineTextAlignment(.leading)
                    Text(self.location)
                        .font(.system(size: 14, weight: .medium))
                }
                HStack {
                    VStack {
                        Text(String(self.follower_count))
                            .font(.system(size: 18, weight: .heavy))
                        Text("Followers")
                            .font(.system(size: 14, weight: .regular))
                    }
                    VStack {
                        Text(String(self.boulder_count))
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
                StarsView(rating: self.rank)
                    .frame(width: 100)
            }
        }
    }
        
}

struct AreaProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfileHeader(area: Area())
            .environmentObject(AreaSearchViewModel())
    }
}
